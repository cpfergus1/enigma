require_relative 'enigma'

class Encrypt < Enigma
  attr_reader :key_a, :alphabet

  def initialize
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
  end

  def encryption(message, cipherkey, cipherdate)
    keys = generate_keys(total_shift(cipherkey, cipherdate))
    { encryption: cipher(message.downcase, keys), key: cipherkey, date: cipherdate }
  end

  def total_shift(cipherkey, cipherdate)
    generate_shift(cipherkey).merge(offsets(cipherdate)) do |_key, shift, offset|
      shift + offset
    end
  end

end
