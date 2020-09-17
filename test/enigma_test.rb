require './test/test_helper'
require './lib/enigma.rb'
require './lib/cipher.rb'

class EnigmaTest <Minitest::Test

  def setup
    @enigma = Enigma.new('hello world', '02715', '040895')
  end

  def test_enigma_holds_values
    assert_equal 'hello world', @enigma.message
    assert_equal '02715', @enigma.cipherkey
    assert_equal '040895', @enigma.cipherdate
  end

  def test_enigma_can_inject_key_and_date_if_blank

    @enigma.fill_in_blank
    assert_equal '02715', @enigma.cipherkey
    assert_equal '040895', @enigma.cipherdate

    enigma = Enigma.new('hello world')
    enigma.fill_in_blank
    assert_equal Time.now.strftime("%d%m%y"), enigma.cipherdate
    assert_equal 5, enigma.cipherkey.length
  end

end
