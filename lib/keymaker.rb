require_relative 'cipherkey'

class KeyMaker

  attr_reader :key_array, :alphabet, :keys, :shift_direction

  def initialize(shift_direction)
    @key_array = Array(:A..:D)
    @alphabet = Array('a'..'z') + [' ']
    @keys = Hash.new(0)
    @shift_direction = shift_direction
  end

  def create_offsets(key_array)
    key_array.each_with_object({}) do |key, holder|
      holder[key] = last_four[key_array.index(key)].to_i
    end
  end
  def generate_shift(key_array)
    key_array.each_with_object({}) do |key, holder|
      holder[key] = cipher_shift(key_array, key)
    end
  end


end
