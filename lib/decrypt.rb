require './lib/enigma'
require 'json'

message_to_decrypt = File.open(ARGV[0],'r')
encrypted = JSON.load(message_to_decrypt)
message_to_decrypt.close

enigma = Enigma.new
encryption = enigma.decrypt(encrypted["encryption"], ARGV[2], ARGV[3])

encrypted = File.open(ARGV[1],'w')
encrypted.write JSON.dump(encryption)
encrypted.close
puts "Created 'decrypted.txt' with the key #{enigma.key_maker.cipher_key.cipherkey} and date #{enigma.key_maker.cipher_key.cipherdate}"
