require_relative 'cipher_key'
require_relative 'keymaker'

class Enigma
  attr_reader :key_maker

  def initialize
    @key_maker = ''
  end

  def encrypt(message, cipherkey = nil, cipherdate = nil)
    @key_maker = KeyMaker.new(1, cipherkey, cipherdate)
    key_maker.generate_keys
    { encryption: cipher(message, key_maker.keys),
      key: key_maker.cipher_key.cipherkey,
      date: key_maker.cipher_key.cipherdate }
  end

  def decrypt(encryption, cipherkey, cipherdate = nil)
    @key_maker = KeyMaker.new(-1, cipherkey, cipherdate)
    key_maker.generate_keys
    { decryption: cipher(encryption, key_maker.keys),
      key: key_maker.cipher_key.cipherkey,
      date: key_maker.cipher_key.cipherdate }
  end

  def cipher(message, key_hash)
    cipher = []
    char_num = 0
    loop do
      break if char_num > message.length

      cipher << key_hash[key_hash.keys[char_num % 4]][message.chars[char_num]]
      char_num += 1
    end
    cipher.join
  end

  def crack(message, date = nil)
    key_guess = '00000'
    decrypted_attempt = ''
    loop do
      @key_maker = KeyMaker.new(-1, key_guess, date)
      key_maker.generate_keys
      decrypted_attempt = cipher(message, key_maker.keys)
      break if decrypted_attempt[-4..-1] == ' end'

      key_guess = (key_guess.to_i + 1).to_s.rjust(5, '0')
    end
    { decryption: decrypted_attempt,
      key: key_maker.cipher_key.cipherkey,
      date: key_maker.cipher_key.cipherdate }
  end

end
