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

  def test_can_combine_key_and_offset
    key_1 = Key.new("12345")
    offset_1 = Offset.new("270819")
    shift_1 = Shift.new(key_1, offset_1)
    assert_equal ({:A=>12, :B=>30, :C=>40, :D=>46}), shift_1.combine
  end
  



  # def test_can_add_alphabet
  #   expected  = ("a".."z").to_a << " "
  #   assert_equal expected,
  # end

end
