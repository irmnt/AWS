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

### Put Object with SSE-C