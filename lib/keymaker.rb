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

end
