## Create a bucket
```sh
aws s3 mb s3://encryption-fun-ik-0407
```

### Create a file and Put Object with encryption SS3-S3
```sh
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-ik-0407
```

### Put objct with eencryption of SSE-kms
```sh
aws s3api put-object \
--bucket encryption-fun-ik-0407 \
--key hello.txt \
--body hello.txt \
--server-side-encryption "aws:kns" \
--ssekms-key-id "xxxxxxxxxxxxxxxxxxxxxxxx"
```

### Put Object with SSE-C [Failed Attempt]
```sh
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY

export MDS_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 -w0)
echo $MD5_VALUE

aws s3pi put-object \
--bucket encryption-fun-ik-0407 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AS256 \
--sse-cusomer-key $basE64_ENCODED_KEY \
#--sse-customer-key-md5 $MD5_VALUE
```

```
An error occurred (Invalidrgumnt) when calling the PutObjct operation: The calculated MD5 hash of the key did not mtch the hash that was provided.
```