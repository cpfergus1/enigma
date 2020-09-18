require './test/test_helper'
require './lib/encrypt.rb'
require './lib/cipher.rb'

class EncryptTest <Minitest::Test

  def setup
    @encrypt = Encrypt.new
  end

  def test_encrypt_exists
    assert Encrypt, @encrypt
  end

  def test_encrypt_can_create_cipherkey
    assert_equal 5, @encrypt.fill_in_cipherkey.length
  end

  def test_encrypt_can_create_cipherdate
    expected = Time.now.strftime("%d%m%y")
    assert_equal expected, @encrypt.fill_in_cipherdate
  end

  def test_encrypt_can_generate_keys
    cipherkey = '02715'
    expected = { A: 2,
                 B: 27,
                 C: 71,
                 D: 15
               }
    assert_equal expected, @encrypt.generate_shift(cipherkey)
  end

  def test_encrypt_can_create_offsets
    cipherdate = '040895'
    expected = { A: 1,
                 B: 0,
                 C: 2,
                 D: 5
               }
    assert_equal expected, @encrypt.offsets(cipherdate)
  end

  def test_can_pull_last_of_date_squared
    cipherdate = '040895'
    assert_equal '1025', @encrypt.last_four(cipherdate)
  end

  def test_can_pull_cipher_key_shift
    cipherkey = '02715'
    key = :A
    assert_equal 2, @encrypt.cipher_shift(cipherkey, key)
  end


  def test_encrypt_can_encrypt
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }
    assert_equal expected, @encrypt.encryption("hello world", "02715", "040895")
  end

  def test_encrypt_can_create_total_shift
    cipherkey = '02715'
    cipherdate = '040895'
    expected = { A: 3,
                 B: 27,
                 C: 73,
                 D: 20
               }
    assert_equal expected, @encrypt.total_shift(cipherkey, cipherdate)
  end

  def test_engima_can_create_key
    mock_shift = { A: 1,
                   B: 2,
                   C: 3,
                   D: 4
                 }
    @encrypt.stubs(:alphabet).returns [ 'a', 'b', 'c', 'd' ]

    expected = {  A: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                  B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                  C: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                  D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    assert_equal expected, @encrypt.generate_keys(mock_shift)
  end

  def test_encryption
    message = 'abcd'
    mock_shift = {  A: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                    B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                    C: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                    D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    expected = 'bdbd'
    assert_equal expected, @encrypt.cipher(message, mock_shift)
  end

end
