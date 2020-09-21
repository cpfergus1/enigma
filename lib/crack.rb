require './lib/enigma'
require 'json'

message_to_decrypt = File.open(ARGV[0], 'r')
encrypted = message_to_decrypt.read.delete_prefix('"').chomp('"')
message_to_decrypt.close

enigma = Enigma.new
cracked_result = enigma.crack(encrypted, ARGV[2])

cracked = File.open(ARGV[1], 'w')
cracked.write JSON.dump(cracked_result[:decryption])
cracked.close
print "Created 'cracked.txt' with "
print "the cracked key #{cracked_result[:key]}"
puts " and date #{cracked_result[:date]}."
