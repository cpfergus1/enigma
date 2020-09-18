require_relative 'cipher'

class Encrypt
  include Cipher
  attr_reader :key_a, :alphabet

  def initialize
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
  end

  def encryption(encryption, cipherkey, cipherdate)
    keys = generate_keys(total_shift(cipherkey, cipherdate))
    { encryption: cipher(encryption, keys), key: cipherkey, date: cipherdate }
  end

  def total_shift(cipherkey, cipherdate)
    generate_shift(cipherkey).merge(offsets(cipherdate)) do |_key, shift, offset|
      shift + offset
    end
  end

  def fill_in_cipherkey
    rand.to_s[2..6]
  end

  def fill_in_cipherdate
    Time.now.strftime('%d%m%y')
  end
end
