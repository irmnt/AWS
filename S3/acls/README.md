## Create a bucket
```sh
aws s3api create-bucket --bucket acl-example-ik-0329 --region ca-central-1
```

## turn of Block Public Access for ACLs
```sh
aws s3api put-public-access-block \
--bucket acl-example-ik-0329 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorepublicAcls=false,BlockpublickPolicy=true,RestrictpublicBuckets=true"


aws s3api get-public-access-block --bucket acl-example-ik-0329
```

## Change Bucket Ownership
```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-ik-0329 \
--ownership-controls="Rules=[{Objectpwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for a user in another AWS Account
```sh
aws s3api put-bucket-acl \
--bucket acl-example-ik-0329 \
--access-control-policy file://workspace/AWS-Examples/s3/acls/policy.json
```

## Access Bucket from other account
```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-ik-0329
aws s3 ls s3://acl-example-ik-0329
```

## Cleanup
```sh
aws rm s3://acl-example-ik-0329/bootcamp.txt
aws rb s3://acl-example-ik-0329
```
