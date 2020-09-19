require './test/test_helper'
require './lib/enigma.rb'
require './lib/ciypher_key.rb'


class EnigmaTest <Minitest::Test

  def setup
    @enigma = Enigma.new
    @enigma.params('legit message', '02715', '040895')
  end

  def test_encrypt_exists
    assert Enigma, @enigma
  end





  def test_encrypt_can_encrypt
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_can_create_total_shift
    expected = { A: 3,
                 B: 27,
                 C: 73,
                 D: 20
               }
    # @enigma.stubs(:cipherkey).returns '02715'
    assert_equal expected, @enigma.total_shift(1)
  end

  def test_engima_can_create_key
    mock_shift = { A: 1,
                   B: 2,
                   C: 3,
                   D: 4
                 }
    @enigma.stubs(:alphabet).returns [ 'a', 'b', 'c', 'd' ]

    expected = {  A: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                  B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                  C: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                  D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    assert_equal expected, @enigma.generate_keys(mock_shift)
  end

  def test_encryption
    message = 'abcd'
    mock_shift = {  A: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                    B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                    C: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                    D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    expected = 'bdbd'
    assert_equal expected, @enigma.cipher(message, mock_shift)
  end

  def test_enigma_can_decrypt
    enigma = Enigma.new
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
               }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_decrypt_can_create_total_shift
    enigma = Enigma.new
      expected = { A: -3,
                 B: -27,
                 C: -73,
                 D: -20
               }
    enigma.params('legit message', '02715', '040895')
    assert_equal expected, enigma.total_shift(-1)
  end

  def test_decrypt_can_create_key
    mock_shift = { A: 1,
                   B: 2,
                   C: 3,
                   D: 4
                 }
  @enigma.stubs(:alphabet).returns [ 'a', 'b', 'c', 'd' ]

    expected = {  A: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                  B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                  C: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                  D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    assert_equal expected, @enigma.generate_keys(mock_shift)
  end

  def test_decryption
    enigma = Enigma.new
    message = 'abcd'
    mock_shift = {  A: { 'a' => 'd', 'b' => 'a', 'c' => 'b', 'd' => 'c' },
                    B: { 'a' => 'c', 'b' => 'd', 'c' => 'a', 'd' => 'b' },
                    C: { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'a' },
                    D: { 'a' => 'a', 'b' => 'b', 'c' => 'c', 'd' => 'd' } }
    expected = 'dddd'
    assert_equal expected, enigma.cipher(message, mock_shift)
  end

  def test_encrypt_can_encrypt_with_no_date
    enigma = Enigma.new
    expected = {
                encryption: "pib wdmczpu",
                key: "02715",
                date: "180920"
               }
    assert_equal expected, enigma.encrypt("hello world", '02715')
  end

  def test_decrypt_can_decrypt_with_todays_date
    enigma = Enigma.new
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "180920"
               }
    encrypted = enigma.encrypt("hello world", '02715')
    assert_equal expected, enigma.decrypt(encrypted[:encryption], '02715')
  end

end
