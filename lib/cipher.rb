module Cipher

  def cipher(message, key_hash)
    cipher = []
    iter = 0
    loop do
      break if iter > message.length
      cipher << key_hash[@key_a[iter % 4]][message.chars[iter]]
      iter += 1
    end
    cipher.join
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

  def generate_keys(shift_hash)
    @key_a.each_with_object({}) do |key, output|
      output[key] = Hash[alphabet.zip(alphabet.rotate(shift_hash[key]))]
    end
  end
end
