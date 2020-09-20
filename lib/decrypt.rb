require './lib/enigma'
require 'json'

message_to_decrypt = File.open(ARGV[0], 'r')
encrypted = JSON.parse(message_to_decrypt)
message_to_decrypt.close

enigma = Enigma.new
decryption = enigma.decrypt(encrypted['encryption'], ARGV[2], ARGV[3])

decrypted = File.open(ARGV[1], 'w')
decrypted.write JSON.dump(decryption)
decrypted.close
print "Created 'decrypted.txt' with "
print "the key #{enigma.key_maker.cipher_key.cipherkey} "
puts "and date #{enigma.key_maker.cipher_key.cipherdate}"
