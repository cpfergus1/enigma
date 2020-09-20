class CipherKey
  attr_reader :cipherkey, :cipherdate

  def initialize(cipherkey = nil, cipherdate = nil)
    @cipherkey = fill_in_cipherkey(cipherkey)
    @cipherdate = fill_in_cipherdate(cipherdate)
  end

  def fill_in_cipherkey(cipherkey)
    if cipherkey.nil?
      rand.to_s[2..6]
    else
      cipherkey
    end
  end

  def fill_in_cipherdate(cipherdate)
    if cipherdate.nil?
      Time.now.strftime('%d%m%y')
    else
      cipherdate
    end
  end

  def last_four
    (cipherdate.to_i**2).to_s[-4..-1]
  end

  def cipher_shift(key_array, key)
    cipherkey[key_array.index(key)..(key_array.index(key) + 1)].to_i
  end


end
