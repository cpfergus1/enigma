require './lib/enigma'
require 'json'

message_to_encrypt = File.open(ARGV[0],'r')
message = (message_to_encrypt.read).chomp
message_to_encrypt.close

enigma = Enigma.new
encryption = enigma.encrypt(message)

encrypted = File.open(ARGV[1],'w')
encrypted.write JSON.dump(encryption)
encrypted.close
puts "Created 'encrypted.txt with the key #{enigma.cipherkey} and date #{enigma.cipherdate}"
