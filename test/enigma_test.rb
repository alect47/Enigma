require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @key = Key.new("12345")
    @offset = Offset.new("280819")
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_attributes
    # assert_instance_of Key, @enigma.key
    # assert_instance_of Offset, @enigma.offset
    # assert_instance_of Shift, @enigma.shift
    assert_equal ("a".."z").to_a << " ", @enigma.alphabet
  end

  def test_make_shift_hash
    assert_equal ({:A=>12, :B=>30, :C=>40, :D=>46}), @enigma.make_shift_hash("12345", "280819")
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
    assert_equal "hi hello", @enigma.index_to_phrase([7, 8, 26, 7, 4, 11, 11, 14])
  end

  def test_rotate_alphabet
    assert_equal "d", @enigma.rotate_alphabet(3)[0]
  end

  def test_use_shift_to_rotate_alphabet
    # @enigma.stubs(:make_shift_hash).returns({:A=>1, :B=>2, :C=>3, :D=>4})
    assert_equal "m", @enigma.use_shift_rotate("12345", "280819")[:A][0]
  end

  def test_convert_shift_to_mod
    expected = {:A=>12, :B=>3, :C=>13, :D=>19}
    assert_equal expected, @enigma.convert_shift_to_mod("12345", "280819")
  end

  def test_add_key_value_to_letter_index
    # skip
    # @enigma.stubs(:convert_shift_to_mod).returns({:A=>25, :B=>23, :C=>3, :D=>1})
    assert_equal [19, 11, 12, 26, 16, 14, 24, 6], @enigma.new_values("hi hello", "12345", "280819")
  end

  def test_encrypt
    skip
    expected =
    assert_equal "", @enigma.encrypt("hi hello", "12345", "280819")
  end


end
