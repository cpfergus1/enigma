class Enigma

  attr_reader :message, :cipherkey, :cipherdate

  def initialize
  end

  def encrypt(message, cipherkey = nil, cipherdate = nil)
    fill_in_cipherkey if cipherkey.is_nil?
    fill_in_cipherdate if cipherdate.is_nil?
    ebd


  def fill_in_cipherkey
    cipherkey = (rand(10 ** 5)).to_s if cipherkey == nil
  end

  def fill_in_cipherdate
    cipherdate = Time.now.strftime("%d%m%y") if cipherdate == ''
  end

end
