class CipherKey

  attr_reader :cipherkey, :cipherdate, :key_a, :alphabet

  def initialize(cipherkey, cipherdate)
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
    @cipherkey = cipherkey
    @cipherdate = cipherdate
  end


end
