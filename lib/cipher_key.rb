class CipherKey

  attr_reader :cipherkey, :cipherdate

  def initialize(cipherkey = nil, cipherdate = nil)
    @cipherkey = cipherkey
    @cipherdate = cipherdate
  end

  def fill_in_cipherkey
    @cipherkey = rand.to_s[2..6] if @cipherkey.nil?
  end

  def fill_in_cipherdate
    @cipherdate = Time.now.strftime('%d%m%y') if @cipherdate.nil?
  end

  def create_offsets(key_array)
    key_array.each_with_object({}) do |key, holder|
      holder[key] = last_four[key_array.index(key)].to_i
    end
  end

  def last_four
    (cipherdate.to_i**2).to_s[-4..-1]
  end


end
