require_relative 'cipher_key'

class KeyMaker

  attr_reader :key_array, :alphabet, :keys, :shift_direction, :cipher_key

  def initialize(shift_direction, cipherkey, cipherdate)
    @key_array = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
    @keys = Hash.new(0)
    @shift_direction = shift_direction
    @cipher_key = CipherKey.new(cipherkey, cipherdate)
  end

  def create_offsets
    key_array.each_with_object({}) do |key, holder|
      holder[key] = cipher_key.last_four[key_array.index(key)].to_i
    end
  end

  def generate_shift
    key_array.each_with_object({}) do |key, holder|
      holder[key] = cipher_key.cipher_shift(key_array, key)
    end
  end

  def total_shift
    generate_shift.merge(create_offsets) do |_key, shift, offset|
      (shift + offset) * shift_direction
    end
  end

  def generate_keys
    @keys = key_array.each_with_object({}) do |key, output|
      output[key] = zip_to_hash(key)
    end
    
  end

  def zip_to_hash(key)
    Hash[alphabet.zip(alphabet.rotate(total_shift[key]))]
  end
end
