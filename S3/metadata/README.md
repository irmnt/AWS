## Create a bucket
```sh
aws s3 mb s3://metadata-fun-ik-0317
```

### create a new file
```sh
echo "Hello Mars" > hello.tx
```

## Upload file with metadata
```sh
aws s3api put-object --bucket metadata-fun-ik-0317 --key hello.txt --body hello.txt --metadata Planet=Mars
```

## get Metadata through head object
```sh
aws s3api put-object --bucket metadata-fun-ik-0317 --key hello.txt
```