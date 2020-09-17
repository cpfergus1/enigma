require 'test_helper'
require './lib/enigma.rb'
require './lib/cypher.rb'

class EnigmaTest <Minitest::Test

  def setup
    @enigma = Enigma.new("hello world", "02715", "040895")
  end

  def test_enigma_holds_values
    assert_equal "hello world", @enigma.message
    assert_equal "02715", @enigma.cipherkey
    assert_equal '040895', @enigma.cipherdate
  end

end
