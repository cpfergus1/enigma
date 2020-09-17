class Enigma

  attr_reader :message, :cipherkey, :cipherdate

  def initialize
  end

  def fill_in_cipherkey
    cipherkey = (rand(10 ** 5)).to_s if cipherkey == nil
  end

  def fill_in_cipherdate
    cipherdate = Time.now.strftime("%d%m%y") if cipherdate == ''
  end

end
