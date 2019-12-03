#!/usr/local/bin/ruby
require 'openssl'

# This reads the output from the pre-cipher file. 

data = File.read("./postCeaser.txt")
puts data
cipher = OpenSSL::Cipher.new('aes-128-cbc-hmac-sha256')

cipher.encrypt
key = cipher.random_key
iv = cipher.random_iv

encrypted = cipher.update(data) + cipher.final

puts encrypted

decipher = OpenSSL::Cipher.new('aes-128-cbc-hmac-sha256')
decipher.decrypt
decipher.key = key
decipher.iv = iv

plain = decipher.update(encrypted) + decipher.final

puts plain
