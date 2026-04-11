require 'openssl'
require 'aws-sdk-s3'

key = openSSL::PKey::RSA.new(1024)

bucket = 'nceypt-client-fun-ik-0410'
object_key = 'hello.txt'

# encryptio client
s3 = AWS::S3::EncryptionV2::Client.new(
    encryption_key: key,
    key_wrap_schema: :rsa_oaep_sha1,
    contet_encryption_schema: :aes_gcm_no_padding,
    security_profile: :v2
)

# round-trip an object, encrypted/decrypted locally
resp = s3.put_object(bucket: bucket, key: object_key, body: 'handshake')
# binding.pry
puts "PUT"
puts resp
resp = s3.get_object(bucket: bucket, key: object_key).body.read
puts "GET WITH KEY"
puts resp

# reading encryption object without the encrption client
Aws::S3::Client.new.get_object(bucket: bucket, key: object_key).body.read
puts "GET WITHOUT KEY"
puts resp