require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_attributes
    assert_instance_of Key, @enigma.key
    assert_instance_of Offset, @enigma.offset
    assert_instance_of Shift, @enigma.shift
    assert_equal ("a".."z").to_a << " ", @enigma.alphabet
  end


end
