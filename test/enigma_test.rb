require './test/test_helper'
require './lib/enigma.rb'
require './lib/cipher.rb'

class EnigmaTest <Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert Enigma, @enigma
  end

  def test_enigma_can_create_cipherkey
    assert_equal 5, enigma.fill_in_cipherkey.length
  end

  def test_enigma_can_create_cipherdate
    assert_equal Time.now.strftime("%d%m%y"), enigma.fill_in_cipherdate
  end

  def test_enigma_can_encrypt
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")

end
