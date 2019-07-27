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

  def test_find_alphabet_index
    assert_equal 7, @enigma.find_position("h")
  end

  def test_convert_letter_to_index
    assert_equal [7, 8, 26, 7, 4, 11, 11, 14], @enigma.letter_to_index("hi hello")
  end

  def test_convert_index_to_letter
    expected = ["h", "i", " ", "h", "e", "l", "l", "o"]
    assert_equal expected, @enigma.index_to_letter([7, 8, 26, 7, 4, 11, 11, 14])
  end

  def test_rotate_alphabet
    assert_equal "d", @enigma.rotate_alphabet(3)[0]
  end

  def test_use_shift_to_rotate_alphabet
    @enigma.shift.stubs(:combine).returns({:A=>1, :B=>2, :C=>3, :D=>4})
    assert_equal "b", @enigma.use_shift_rotate[:A][0]
  end

  def test_convert_shift_to_mod
    # binding.pry
    assert_equal "", @enigma.convert_shift_to_mod
  end

  def test_add_key_value_to_letter_index
    # binding.pry
    assert_equal [9, 8, 6, 7, 4, 11, 11, 14], @enigma.new_values("hi hello")
  end


end
