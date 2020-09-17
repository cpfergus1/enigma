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
      holder[key.to_sym] = cipherkey[@key_a.index(key)..(@key_a.index(key)+1)]
    end
  end

  

  def fill_in_cipherkey
    (rand(10 ** 5)).to_s
  end

  def fill_in_cipherdate
    Time.now.strftime("%d%m%y")
  end

end
