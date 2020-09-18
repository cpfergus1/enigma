class Decrypt
  attr_reader :key_a, :alphabet

  def initialize
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
  end

  def decrypt(encryption, cipherkey, cipherdate)
    keys = generate_keys(total_shift(cipherkey, cipherdate))
    { decryption: decryption(encryption, keys), key: cipherkey, date: cipherdate }
  end

  def decryption(encryption, key_hash)
    decryption = []
    iter = 0
    loop do
      break if iter > encryption.length
      decryption << key_hash[@key_a[iter % 4]][encryption.chars[iter]]
      iter += 1
    end
    decryption.join
  end

  def generate_shift(cipherkey)
    @key_a.each_with_object({}) do |key, holder|
      holder[key] = cipher_shift(cipherkey, key)
    end
  end

  def cipher_shift(cipherkey, key)
    cipherkey[@key_a.index(key)..(@key_a.index(key) + 1)].to_i
  end

  def offsets(cipherdate)
    @key_a.each_with_object({}) do |key, holder|
      holder[key] = last_four(cipherdate)[@key_a.index(key)].to_i
    end
  end

  def last_four(cipherdate)
    (cipherdate.to_i**2).to_s[-4..-1]
  end

  def total_shift(cipherkey, cipherdate)
    generate_shift(cipherkey).merge(offsets(cipherdate)) do |_key, shift, offset|
      (shift + offset) * -1
    end
  end

  def generate_keys(shift_hash)
    @key_a.each_with_object({}) do |key, output|
      output[key] = Hash[alphabet.zip(alphabet.rotate(shift_hash[key]))]
    end
  end
end
