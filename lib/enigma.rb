class Enigma
  attr_reader :key_a, :alphabet, :message, :cipherkey, :cipherdate

  def initialize
    @key_a = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
    @message = ''
    @cipherkey = ''
    @cipherdate = ''
  end

  def params(message, cipherkey, cipherdate)
    @message = message.downcase
    fill_in_cipherkey(cipherkey)
    fill_in_cipherdate(cipherdate)
  end

  def encrypt(message, cipherkey = nil, cipherdate = nil)
    params(message, cipherkey, cipherdate)
    keys = generate_keys(total_shift(1))
    { encryption: cipher(@message, keys),
      key: @cipherkey,
      date: @cipherdate }
  end

  def decrypt(encryption, cipherkey, cipherdate = nil)
    params(encryption, cipherkey, cipherdate)
    keys = generate_keys(total_shift(-1))
    { decryption: cipher(@message, keys),
      key: @cipherkey,
      date: @cipherdate }
  end

  def total_shift(shift_direction)
    generate_shift.merge(offsets) do |_key, shift, offset|
      (shift + offset) * shift_direction
    end
  end

  def cipher(message, key_hash)
    cipher = []
    key_rotate = 0
    loop do
      break if key_rotate > message.length

      cipher << key_hash[@key_a[key_rotate % 4]][message.chars[key_rotate]]
      key_rotate += 1
    end
    cipher.join
  end

  def generate_shift
    @key_a.each_with_object({}) do |key, holder|
      holder[key] = cipher_shift(key)
    end
  end

  def cipher_shift(key)
    cipherkey[indicie(key)..(indicie(key) + 1)].to_i
  end

  def offsets
    @key_a.each_with_object({}) do |key, holder|
      holder[key] = last_four[indicie(key)].to_i
    end
  end

  def last_four
    (cipherdate.to_i**2).to_s[-4..-1]
  end

  def generate_keys(shift_hash)
    @key_a.each_with_object({}) do |key, output|
      output[key] = zip_to_hash(shift_hash, key)
    end
  end

  def zip_to_hash(shift_hash, key)
    Hash[alphabet.zip(alphabet.rotate(shift_hash[key]))]
  end

  def fill_in_cipherkey(cipherkey)
    if cipherkey
      @cipherkey = cipherkey
    else
      @cipherkey = rand.to_s[2..6]
    end
  end

  def fill_in_cipherdate(cipherdate)
    if cipherdate
      @cipherdate = cipherdate
    else
      @cipherdate = Time.now.strftime('%d%m%y')
    end
  end

  def indicie(key)
    @key_a.index(key)
  end
end
