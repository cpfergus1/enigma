class Enigma

  attr_reader :message, :cipherkey, :cipherdate

  def initialize
    @key_a =Array('A'..'D')
    @alphabet = Array('a'..'z') + [' ']
  end

  def encrypt(message, cipherkey = nil, cipherdate = nil)
    fill_in_cipherkey if cipherkey.is_nil?
    fill_in_cipherdate if cipherdate.is_nil?
  end

  def generate_keys(cipherkey)
    @key_a.each_with_object({}) do |key, holder|
      holder[key.to_sym] = cipher_shift(cipherkey, key)
    end
  end

  def cipher_shift(cipherkey, key)
    cipherkey[@key_a.index(key)..(@key_a.index(key)+1)].to_i
  end

  def offsets(cipherdate)
    @key_a.each_with_object({}) do |key, holder|
      holder[key.to_sym] = last_four(cipherdate)[@key_a.index(key)].to_i
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



end
