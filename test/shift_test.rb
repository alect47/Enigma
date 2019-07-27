require './test/test_helper'

class ShiftTest < Minitest::Test

  def setup
    # binding.pry
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_shift_has_attributes
    skip
    assert_equal ({}), @shift.keys
    assert_equal ({}), @shift.offsets
  end

  def test_add_keys
    skip
    assert_equal @key, @shift.add_keys(@key)
  end

  def test_add_offsets
    skip
    assert_equal @offset, @shift.add_offsets(@offset)
  end



  # def test_can_add_alphabet
  #   expected  = ("a".."z").to_a << " "
  #   assert_equal expected,
  # end

end
