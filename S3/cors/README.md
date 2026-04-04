# Create Website 1
## Creaet a bucket
```sh
aws s3 mb s3://cors-fun-ik-0403
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-fun-ik-0403 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-fun-ik-0403 --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun-ik-0403 --website-configuration file://website.json
```

## Upload our javascript file
```sh
aws s3 cp index.html s3://cors-fun2-ik-0403
```

## View the website and see if the index.html is there.
```
this is for ca-central-1
http://cors-fun-ik-0403.s3-website.ca-central-1.amazonaws.com

Other regions mighr use a hyphen instead
http://cors-fun-ik-0403.s3-website-ca-central-1.amazonaws.com
```

# Create Website 2
## Creaet a bucket
```sh
aws s3 mb s3://cors-fun2-ik-0403
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-fun2-ik-0403 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-fun2-ik-0403 --policy file://bucket-policy2.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun2-ik-0403 --website-configuration file://website.json
```

## Upload our javascript file
```sh
aws s3 cp hello.js s3://cors-fun2-ik-0403
```

## Create api Gateway with mock response and then test the endpoint
```sh
curl -X POST -H 'Content-Type: application/json" http://1kccnjkm43.execute-api.ca-central-1.amazonaws.com/prod/hello
```

## Set CORS on our bucket
```sh
aws s3api put-bucket-cors --bucket cors-fun-ik-0403 --cors-configuration file://cors.json
```