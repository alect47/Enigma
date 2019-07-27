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

  def test_convert_message_to_array
    expected = ["h", "i", " ", "h", "e", "l", "l", "o"]
    assert_equal expected, @enigma.to_array("hi hello")
  end

  def test_rotate_alphabet
    assert_equal "d", @enigma.rotate_alphabet(3)[0]
  end

  def test_use_shift_to_rotate_alphabet
    @enigma.shift.stubs(:combine).returns({:A=>1, :B=>2, :C=>3, :D=>4})
    # binding.pry
    assert_equal "", @enigma.use_shift_rotate
  end


end
