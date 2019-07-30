require './test/test_helper'

class EnigmaHelperTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_convert_message_to_array
    expected = ["H", "i", " ", "h", "e", "l", "l", "o", "!"]
    assert_equal expected, @enigma.to_array("Hi hello!")
  end

  def test_find_alphabet_index
    assert_equal 7, @enigma.find_position("h")
  end

  def test_convert_letter_to_index
    assert_equal [7, 8, 26, 7, 4, 11, 11, 14, "!"], @enigma.letter_to_index("Hi hello!")
  end

  def test_convert_index_to_phrase
    assert_equal "hi hello!", @enigma.index_to_phrase([7, 8, 26, 7, 4, 11, 11, 14, "!"])
  end

  def test_rotate_alphabet
    assert_equal "d", @enigma.rotate_alphabet(3)[0]
  end

  def test_use_shift_to_rotate_alphabet
    assert_equal "m", @enigma.use_shift_rotate("12345", "280819")[:A][0]
  end

  def test_convert_shift_to_mod
    expected = {:A=>12, :B=>3, :C=>13, :D=>19}
    assert_equal expected, @enigma.convert_shift_to_mod("12345", "280819")
  end

  def test_count_up_keys
    assert_instance_of Array, @enigma.count_up_keys
  end

  def test_find_shift_of_last_four
    expected = {:A=>["f", 20], :B=>["d", 21], :C=>["f", 22], :D=>["i", 23]}
    assert_equal expected, @enigma.find_shift_of_last_four("vjqtbeawesjjsjsdfkjhfdfi")
  end

  def test_order_last_four
    expected = [[:D, ["s", 19]], [:A, ["d", 20]], [:B, ["s", 21]], [:C, ["i", 22]]]
    assert_equal expected, @enigma.order_last_four("vjqtbeaweqsdfsdfihhsdsi")
  end


end
