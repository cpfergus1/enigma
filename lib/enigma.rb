require_relative 'cipher_key'
require_relative 'keymaker'

class Enigma
  attr_reader :key_a, :alphabet, :message, :cipherkey, :cipherdate

  def initialize
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
    @message = ''
    @cipherkey = ''
    @cipherdate = ''
  end

  def params(message, cipherkey, cipherdate)
    @message = message.downcase
    fill_in_cipherkey(cipherkey)
    fill_in_cipherdate(cipherdate)
  end

  def encrypt(message, cipherkey = nil, cipherdate = nil)
    params(message, cipherkey, cipherdate)
    keys = generate_keys(total_shift(1))
    { encryption: cipher(@message, keys),
      key: @cipherkey,
      date: @cipherdate }
  end

  def decrypt(encryption, cipherkey, cipherdate = nil)
    params(encryption, cipherkey, cipherdate)
    keys = generate_keys(total_shift(-1))
    { decryption: cipher(@message, keys),
      key: @cipherkey,
      date: @cipherdate }
  end

  def cipher(message, key_hash)
    cipher = []
    key_rotate = 0
    loop do
      break if key_rotate > message.length

      cipher << key_hash[@key_a[key_rotate % 4]][message.chars[key_rotate]]
      key_rotate += 1
    end
    cipher.join
  end






end
