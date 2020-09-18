require './test/test_helper'
require './lib/decrypt.rb'
require './lib/enigma.rb'

class DecryptTest <Minitest::Test

  def setup
  @decrypt = Decrypt.new
  end

  def test_existence
    assert Decrypt, @decrypt
  end
end
