## Create a new s3 bucket

```sh
aws s3 mb s3://checksums-examples
```


## Create a file that will we do a checksum on
```sh
echo "Hello Mars" > myfile.txt
```

## Get a checksu of a file for md5
```sh
md5sum myfile.txt
# <key> myfile.txt
```
