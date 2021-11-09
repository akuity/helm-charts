# Argo CD Disaster Recovery

## Overview

This documentation walks through the steps to install Argo CD with disaster recovery capability.

## Preparing S3 Bucket, IAM Role and Policy

* Create an empty S3 bucket. Note that you may also want to [configure the bucket's lifecycle rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/how-to-set-lifecycle-configuration-intro.html) to control the lifetime of the backups and transition them to another storage class.
* [Create an IAM policy](https://docs.aws.amazon.com/eks/latest/userguide/create-service-account-iam-policy-and-role.html) `dr-s3-policy` to allow read/write access from the DR CronJob:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::BUCKETNAME"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::BUCKETNAME/*"
        }
    ]
}
```
* Create an IAM role `argocd-dr-s3` with the above policy attached.
* [Obtain the OIDC ARN and ID](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html) via the following:
```
# View your cluster's OIDC provider URL
# Example output: https://oidc.eks.us-west-2.amazonaws.com/id/EXAMPLED539D4633E53DE1B716D3041E
aws eks describe-cluster --name myekscluster --query "cluster.identity.oidc.issuer" --output text

# List the IAM OIDC providers in your account.
aws iam list-open-id-connect-providers | grep <EXAMPLED539D4633E53DE1B716D3041E>
```
* Edit the role's trust relationship to the following with the OIDC ARN and ID obtained previously:
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::xxx:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/<OIDC-ID>"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.us-west-2.amazonaws.com/id/<OIDC-ID>:aud": "sts.amazonaws.com",
          "oidc.eks.us-west-2.amazonaws.com/id/<OIDC-ID>:sub": "system:serviceaccount:argocd:argocd-dr-s3"
        }
      }
    }
  ]
}
```

## Backup

Backup is consisted of a CronJob which takes a snapshot of Argo CD, such as Argo CD configmaps (e.g. argocd-cm, argocd-rbac-cm, argocd-ssh-known-hosts-cm, argocd-tls-certs-cm), secrets, applications, and app projects, then uploads it
to a bucket periodically.

Backup can be enabled when installing [Argo CD helm chart](https://github.com/akuity/helm-builds) with the following configuration in [values.yaml](https://github.com/akuity/helm-builds/blob/master/charts/argo-cd/values.yaml).

```
# -- Disaster recovery configurations
disasterRecovery:
  enabled: true
  # -- The schedule to perform backup
  backupSchedule: "*/10 * * * *"
  # -- Limits the maxium runtime when performing backup. This must be within the backup schedule. For example, we might want to limit this to 9-minutes if we run backups every 10 minutes
  activeDeadlineSeconds: 540
  # -- Environment variables to pass to the backup job
  env:
    - name: "BUCKET_NAME"
      value: "argocd-test"
    - name: "ARGOCD_INSTANCE_NAME"
      value: "test-argocd"
    - name: "NAMESPACE"
      value: "argocd"

  eks:
    roleARN: "arn:aws:iam::541216676946:role/argocd-dr-s3"
```

Once Argo CD with DR is installed, backups will be saved to the specified bucket, e.g. [s3://argocd-test](https://s3.console.aws.amazon.com/s3/buckets/argocd-test).

## Recover from a backup

Before running recovery from a previously saved backup, we need to have a barebone Argo CD up and running first (e.g. via Helm).

Next, run the following to recover from a previously saved backup:

```
kubectl run s3-recover \
  --image quay.io/akuity/argocd:v2.1.1-ak0 -t -i --rm=true \
  --serviceaccount argocd-dr-s3  \
  --env="BUCKET_NAME=argocd-test" \
  --env="ARGOCD_INSTANCE_NAME=test-argocd" \
  --env="NAMESPACE=argocd" \
  -- argocd-restore.sh
```

If you need to recover from a backup at a specific date time, you use specify an additional environment variable in the form of `DATETIME=<year>/<month>-<day>/<hour><minute>` in the, e.g. `2021/09-30/1520`.
