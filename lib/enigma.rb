require_relative 'cipher_key'
require_relative 'keymaker'

class Enigma
  attr_reader :message, :keys

  def initialize
  end

  def encrypt(message, cipherkey = nil, cipherdate = nil)
    key_maker = KeyMaker.new(1, cipherkey, cipherdate)
    key_maker.generate_keys
    { encryption: cipher(message, key_maker.keys),
      key: key_maker.cipher_key.cipherkey,
      date: key_maker.cipher_key.cipherdate }
  end

  def decrypt(encryption, cipherkey, cipherdate = nil)
    key_maker = KeyMaker.new(-1, cipherkey, cipherdate)
    key_maker.generate_keys
    { decryption: cipher(encryption, key_maker.keys),
      key: key_maker.cipher_key.cipherkey,
      date: key_maker.cipher_key.cipherdate }
  end

  def cipher(message, key_hash)
    cipher = []
    key_rotater = 0
    loop do
      break if key_rotater > message.length

      cipher << key_hash[key_hash.keys[key_rotater % 4]][message.chars[key_rotater]]
      key_rotater += 1
    end
    cipher.join
  end
end
