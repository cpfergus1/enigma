require './lib/enigma'
require 'json'

message_to_encrypt = File.open(ARGV[0], 'r')
message = message_to_encrypt.read.chomp
message_to_encrypt.close

enigma = Enigma.new
encryption = enigma.encrypt(message)

encrypted = File.open(ARGV[1], 'w')
encrypted.write JSON.dump(encryption)
encrypted.close
print "Created 'encrypted.txt' with"
print "the key #{enigma.key_maker.cipher_key.cipherkey}"
puts " and date #{enigma.key_maker.cipher_key.cipherdate}"
