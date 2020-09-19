class CipherKey

  attr_reader :cipherkey, :cipherdate

  def initialize(cipherkey = nil, cipherdate = nil)
    @cipherkey = cipherkey unless cipherdate.nil?
    @cipherdate = cipherdate unless cipherdate.nil?
    @cipherkey = fill_in_cipherkey if @cipherkey.nil?
    @cipherdate = fill_in_cipherdate if @cipherdate.nil?
  end

  def fill_in_cipherkey
    rand.to_s[2..6]
  end

  def fill_in_cipherdate
    Time.now.strftime('%d%m%y')
  end

  def last_four
    (cipherdate.to_i**2).to_s[-4..-1]
  end

  def cipher_shift(key_array, key)
    cipherkey[key_array.index(key)..(key_array.index(key) + 1)].to_i
  end

end
