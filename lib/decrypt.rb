require_relative 'enigma'

class Decrypt < Enigma

  attr_reader :key_a, :alphabet



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
