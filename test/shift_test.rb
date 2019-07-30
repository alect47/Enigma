require './test/test_helper'

class ShiftTest < Minitest::Test

  def setup
    @key = Key.new("12345")
    @offset = Offset.new("280819")
    @shift = Shift.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_shift_has_attributes
    assert_equal @key, @shift.key
    assert_equal @offset, @shift.offset
  end

  def test_can_combine_key_and_offset
    assert_equal ({:A=>12, :B=>30, :C=>40, :D=>46}), @shift.combine
    assert_equal ({:A=>12, :B=>30, :C=>40, :D=>46}), @shift.shift_hash
  end

  def test_can_make_shift_with_no_input
    key = Key.new
    offset = Offset.new
    shift = Shift.new(key, offset)
    assert_equal 4 , shift.combine.keys.count
  end

end
