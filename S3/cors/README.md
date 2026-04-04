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
cd S3/cors
aws s3api put-bucket-policy --bucket cors-fun-ik-0403 --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun-ik-0403 --website-configuration file://website.json
```

## Upload index.html
```sh
aws s3 cp index.html s3://cors-fun-ik-0403
```

## View the website and see if the index.html is there.
```
this is for ca-central-1
http://cors-fun-ik-0403.s3-website.ca-central-1.amazonaws.com

Other regions mighr use a hyphen instead
http://cors-fun-ik-0403.s3-website-ca-central-1.amazonaws.com
```

# Create Website 2
## Creat a bucket
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

## Configure AWS API Gateway
1. Go to API Gateway > REST API > Build
    - API Details: New API
    - API name: CorsFunAPI
    - API endpoint type: Rgional
1. Create resource
    - Resource path: <default(/)>
    - Resource name: hello
    - CORS: <default(unchecked)>
1. Create method
    - Method type: POST
    - integration type: Mock
1. Go to Integration response tab > Edit
    - Expand Mapping templates
    ```
    {
        message: "Hello world!"
    }
1. Go to /hello > Enable CORS
    - Gateway responses: <default>
    - Access-control-Allow-Headers: POST(checked)
1. Deploy API
    - Stage: "New stage"
    - Stage name: prod
    --> deploy the API and generate its URL


## Create api Gateway with mock response and then test the endpoint
```sh
curl -X POST -H "Content-Type: application/json" https://ulkb9w6vtg.execute-api.ca-central-1.amazonaws.com/prod/hello
```

## Set CORS on our bucket
```sh
aws s3api put-bucket-cors --bucket cors-fun-ik-0403 --cors-configuration file://cors.json
```

## Cleanup
1. API Gateway > Resource > API actions > Delete API
1. S3 > Buckets > <check the target S3 bucket> > Empty
1. S3 > Buckets > <check the target S3 bucket> > Delete