require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    # @key = Key.new
    # @offset = Offset.new
    # @shift = Shift.new(@key, @offset)
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_attributes
    assert_instance_of Key, @enigma.key
    assert_instance_of Offset, @enigma.offset
    assert_instance_of Shift, @enigma.shift

  end

end
