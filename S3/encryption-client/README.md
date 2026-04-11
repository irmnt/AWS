## Create a bucket
```sh
aws s3 mb s3://encrypt-client-fun-ik-0410
```


## Run our SDK ruby script
```sh
bundle init
bundle install
bundle xec ruby encrypt.rb
```

### Cleanup
```sh
aws s3 rm s3://encrypt-client-fun-ik-0410/hello.txt
aws s3 rb s3://encrypt-client-fun-ik-0410
```