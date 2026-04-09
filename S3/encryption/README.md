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
# Exporting the key into BASED64_ENCODED_KEY increases its size of data more than 256 bytes, and AWS CLI rejects the key
# ---> exporting the key into a file and set it as 'fileb://' is the best practice

# export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
# echo $BASE64_ENCODED_KEY

openssl rand -out ssec.key 32

aws s3api put-object \
--bucket encryption-fun-ik-0407 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key fileb://ssec.key
```

### Upload it back without encryption flags
```sh 
aws s3api put-object \
--bucket encryption-fun-ik-0407 \
--key hello.txt \
--body hello.txt
```
