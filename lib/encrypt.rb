class Encrypt

  attr_reader :key_a, :alphabet

  def initialize
    @key_a =Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
  end

  def encrypt(message, cipherkey = nil, cipherdate = nil)
    fill_in_cipherkey if cipherkey.nil?
    fill_in_cipherdate if cipherdate.nil?
    keys = generate_keys(total_shift(cipherkey, cipherdate))
    encoded_message = []
    iter = 0
    loop do
      break if iter > message.length
      encoded_message << keys[@key_a[iter % 4]][message.chars[iter]]
      iter = iter + 1
    end
    {encryption: encoded_message.join, key: cipherkey, date: cipherdate}
  end

  def generate_shift(cipherkey)
    @key_a.each_with_object({}) do |key, holder|
      holder[key] = cipher_shift(cipherkey, key)
    end
  end

  def cipher_shift(cipherkey, key)
    cipherkey[@key_a.index(key)..(@key_a.index(key)+1)].to_i
  end

  def offsets(cipherdate)
    @key_a.each_with_object({}) do |key, holder|
      holder[key] = last_four(cipherdate)[@key_a.index(key)].to_i
    end
  end

  def last_four(cipherdate)
    (cipherdate.to_i ** 2).to_s[-4 .. -1]
  end

  def fill_in_cipherkey
    rand.to_s[2..6]
  end

  def fill_in_cipherdate
    Time.now.strftime("%d%m%y")
  end

  def total_shift(cipherkey, cipherdate)
    generate_shift(cipherkey).merge(offsets(cipherdate)) do |key, shift, offset|
      shift + offset
    end
  end

  def generate_keys(shift_hash)
    @key_a.each_with_object({}) do |key,output|
      output[key] = Hash[alphabet.zip(alphabet.rotate(shift_hash[key]))]
    end
  end
end
