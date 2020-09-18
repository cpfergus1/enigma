require './test/test_helper'
require './lib/decrypt.rb'
require './lib/cipher.rb'

class DecryptTest <Minitest::Test

  def setup
  @decrypt = Decrypt.new
  end

  def test_decrypt_exists
    assert Decrypt, @decrypt
  end

  def test_decrypt_can_generate_keys
    cipherkey = '02715'
    expected = { A: 2,
                 B: 27,
                 C: 71,
                 D: 15
               }
    assert_equal expected, @decrypt.generate_shift(cipherkey)
  end

  def test_decrypt_can_create_offsets
    cipherdate = '040895'
    expected = { A: 1,
                 B: 0,
                 C: 2,
                 D: 5
               }
    assert_equal expected, @decrypt.offsets(cipherdate)
  end

  def test_can_pull_last_of_date_squared
    cipherdate = '040895'
    assert_equal '1025', @decrypt.last_four(cipherdate)
  end

  def test_can_pull_cipher_key_shift
    cipherkey = '02715'
    key = :A
    assert_equal 2, @decrypt.cipher_shift(cipherkey, key)
  end


  def test_decrypt_can_decrypt
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
               }
    assert_equal expected, @decrypt.decryption("keder ohulw", "02715", "040895")
  end

  def test_decrypt_can_create_total_shift
    cipherkey = '02715'
    cipherdate = '040895'
    expected = { A: -3,
                 B: -27,
                 C: -73,
                 D: -20
               }
    assert_equal expected, @decrypt.total_shift(cipherkey, cipherdate)
  end

  def test_decrypt_can_create_key
    mock_shift = { A: 1,
                   B: 2,
                   C: 3,
                   D: 4
                 }
  @decrypt.stubs(:alphabet).returns [ 'a', 'b', 'c', 'd' ]

    expected = {  A: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                  B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                  C: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                  D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    assert_equal expected, @decrypt.generate_keys(mock_shift)
  end

  def test_decryption
    message = 'abcd'
    mock_shift = {  A: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                    B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                    C: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                    D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    expected = 'dddd'
    assert_equal expected, @decrypt.cipher(message, mock_shift)
  end

end
