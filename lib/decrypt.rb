require './lib/enigma'
require 'json'

message_to_decrypt = File.open(ARGV[0], 'r')
encrypted = message_to_decrypt.read.delete_prefix('"').chomp('"')
message_to_decrypt.close

enigma = Enigma.new
decryption = enigma.decrypt(encrypted, ARGV[2], ARGV[3])

decrypted = File.open(ARGV[1], 'w')
decrypted.write JSON.dump(decryption[:decryption])
decrypted.close
print "Created 'decrypted.txt' with "
print "the key #{decryption[:key]} "
puts "and date #{decryption[:date]}."
