class Enigma

  attr_reader :message, :cipherkey, :cipherdate

  def initialize(message, cipherkey = '', cipherdate = '')
    @message = message
    @cipherkey = cipherkey
    @cipherdate = cipherdate
  end

  def fill_in_blank
    @cipherkey = (rand(10 ** 5)).to_s if cipherkey == ''
    @cipherdate = Time.now.strftime("%d%m%y") if cipherdate == ''
  end

end
