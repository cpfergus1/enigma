class CipherKey

  attr_reader :cipherkey, :cipherdate, :key_a, :alphabet

  def initialize(cipherkey = nil, cipherdate = nil)
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
    @cipherkey = cipherkey
    @cipherdate = cipherdate
  end

  def fill_in_cipherkey
    @cipherkey = rand.to_s[2..6] if @cipherkey.nil?
  end

  def fill_in_cipherdate
    @cipherdate = Time.now.strftime('%d%m%y') if @cipherdate.nil?
  end
end
