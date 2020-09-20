require './lib/enigma'
require 'json'

message_to_decrypt = File.open(ARGV[0], 'r')
encrypted = JSON.parse(message_to_decrypt)
message_to_decrypt.close

enigma = Enigma.new
cracked_result = enigma.crack(encrypted['encryption'], ARGV[2])

cracked = File.open(ARGV[1], 'w')
cracked.write JSON.dump(cracked_result)
cracked.close
print "Created 'cracked.txt' with "
print "the cracked key #{enigma.key_maker.cipher_key.cipherkey}."
puts " and date #{enigma.key_maker.cipher_key.cipherdate}."
