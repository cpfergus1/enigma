require './test/test_helper'
require './lib/cipher_key.rb'


class CipherKeyTest <Minitest::Test

  def test_cipher_key_has_attributes
    cipherkey = '02715'
    cipherdate = '040895'
    cipher_key = CipherKey.new(cipherkey, cipherdate)
    assert_equal [:A,:B,:C,:D], cipher_key.key_a
    assert_equal 27, cipher_key.alphabet.length
    assert_equal '02715', cipher_key.cipherkey
    assert_equal '040895', cipher_key.cipherdate
  end

  def test_encrypt_can_create_cipherkey
    cipher_key= CipherKey.new
    assert_equal 5, cipher_key.fill_in_cipherkey.length
  end

  def test_encrypt_can_create_cipherdate
    cipher_key= CipherKey.new
    expected = Time.now.strftime("%d%m%y")
    assert_equal expected, cipher_key.fill_in_cipherdate
  end

end
