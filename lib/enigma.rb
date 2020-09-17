class Enigma

  attr_reader :message, :cipherkey, :cipherdate

  def initialize(message, cipherkey = '', cipherdate = '')
    @message = message
    @cipherkey = cipherkey
    @cipherdate = cipherdate
  end

end
