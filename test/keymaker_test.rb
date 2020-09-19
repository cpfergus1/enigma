require './test/test_helper'
require './lib/cipher_key.rb'
require './lib/keymaker'


class KeyMakerTest <Minitest::Test

  def test_keymaker_has_attributes
    key_maker = KeyMaker.new(1, '02715', '040895')
    assert_equal [:A, :B, :C, :D], key_maker.key_array
    assert_equal 27, key_maker.alphabet.length
    assert_equal Hash.new(0), key_maker.keys
    assert_equal 1, key_maker.shift_direction
    assert_equal CipherKey, key_maker.cipher_key.class
  end

  def test_encrypt_can_create_offsets
    key_maker = KeyMaker.new(1, '02715', '040895')
    expected = { A: 1,
                 B: 0,
                 C: 2,
                 D: 5 }
    assert_equal expected, key_maker.create_offsets
  end

  def test_encrypt_can_generate_keys
    key_maker = KeyMaker.new(1, '02715', '040895')
    expected = { A: 2,
                 B: 27,
                 C: 71,
                 D: 15 }
    assert_equal expected, key_maker.generate_shift
  end

  def test_encrypt_can_create_total_shift
    key_maker = KeyMaker.new(1, '02715', '040895')
    expected = { A: 3,
                 B: 27,
                 C: 73,
                 D: 20
               }
    assert_equal expected, key_maker.total_shift

    key_maker = KeyMaker.new(-1, '02715', '040895')
    expected = { A: -3,
                 B: -27,
                 C: -73,
                 D: -20
               }
    assert_equal expected, key_maker.total_shift
  end

end
