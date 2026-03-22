## Create a bucket
```sh
aws s3 mb s3://class-fun-ik-0321
```

## Create a file
```sh
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://class-fun-ik-0321 --storage-class STANDARD_IA
```

## Cleanup
```sh
aw s3 rm s3://class-fun-ik-0321/hello.txt
aw s3 rb s3://class-fun-ik-0321
```