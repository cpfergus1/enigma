require './test/test_helper'
require './lib/cipher_key.rb'
require './lib/keymaker'


class KeyMakerTest <Minitest::Test
  
  def test_encrypt_can_create_offsets
    cipher_key= CipherKey.new('02715', '040895')
    key_maker = KeyMaker.new
    expected = { A: 1,
                 B: 0,
                 C: 2,
                 D: 5
               }
    assert_equal expected, key_maker.create_offsets
  end

  def test_encrypt_can_generate_keys
    cipher_key= CipherKey.new('02715', '040895')
    key_maker = KeyMaker.new
    expected = { A: 2,
                 B: 27,
                 C: 71,
                 D: 15
               }
    assert_equal expected, key_maker.generate_shift
  end

end
