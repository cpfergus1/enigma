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
    assert_equal 5, @enigma.fill_in_cipherkey.length
  end

  def test_enigma_can_create_cipherdate
    expected = Time.now.strftime("%d%m%y")
    assert_equal expected, @enigma.fill_in_cipherdate
  end

  def test_enigma_can_generate_keys
    cipherkey = '02715'
    expected = { A: '02',
                 B: '27',
                 C: '71',
                 D: '15'
               }
    assert_equal expected, @enigma.generate_keys(cipherkey)
  end

  def test_enigma_can_encrypt
    skip
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

end
