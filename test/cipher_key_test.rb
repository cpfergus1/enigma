require './test/test_helper'
require './lib/cipher_key.rb'

class CipherKeyTest < Minitest::Test
  def test_cipher_key_has_attributes
    cipherkey = '02715'
    cipherdate = '040895'
    cipher_key = CipherKey.new(cipherkey, cipherdate)
    assert_equal '02715', cipher_key.cipherkey
    assert_equal '040895', cipher_key.cipherdate
  end

  def test_cipherkey_can_create_a_cipherkey
    cipher_key = CipherKey.new
    assert_equal 5, cipher_key.cipherkey.length

    cipher_key = CipherKey.new('01234', '180920')
    assert_equal '01234', cipher_key.cipherkey
  end

  def test_encrypt_can_create_cipherdate
    cipher_key = CipherKey.new
    expected = Time.now.strftime('%d%m%y')
    assert_equal expected, cipher_key.cipherdate

    cipher_key = CipherKey.new('01234', '180920')
    assert_equal '180920', cipher_key.cipherdate
  end

  def test_can_pull_last_of_date_squared
    cipher_key= CipherKey.new('02715', '040895')
    assert_equal '1025', cipher_key.last_four
  end

  def test_can_pull_cipher_key_shift
    cipher_key= CipherKey.new('02715', '040895')
    keys = [:A, :B, :C, :D]
    key = :A
    assert_equal 2, cipher_key.cipher_shift(keys, key)
  end
end
