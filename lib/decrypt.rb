require_relative 'cipher'

class Decrypt
  include Cipher
  attr_reader :key_a, :alphabet

  def initialize
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
  end

  def decryption(encryption, cipherkey, cipherdate)
    keys = generate_keys(total_shift(cipherkey, cipherdate))
    { decryption: cipher(encryption, keys), key: cipherkey, date: cipherdate }
  end

  def total_shift(cipherkey, cipherdate)
    generate_shift(cipherkey).merge(offsets(cipherdate)) do |_key, shift, offset|
      (shift + offset) * -1
    end
  end

end
