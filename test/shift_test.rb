require './test/test_helper'

class ShiftTest < Minitest::Test

  def setup
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_shift_has_attributes
    assert_equal @key, @shift.key
    assert_equal @offset, @shift.offset
  end

  def test_add_keys
    assert_equal @key, @shift.add_keys(@key)
  end

  def test_add_offsets
    assert_equal @offset, @shift.add_offsets(@offset)
  end



  # def test_can_add_alphabet
  #   expected  = ("a".."z").to_a << " "
  #   assert_equal expected,
  # end

end
