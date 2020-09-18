require './test/test_helper'
require './lib/encrypt.rb'
require './lib/enigma.rb'

class EncryptTest <Minitest::Test

  def setup
    @encrypt = Encrypt.new
  end

  def test_existence
    assert Encrypt, @encrypt
  end
end
