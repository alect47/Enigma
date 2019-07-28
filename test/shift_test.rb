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
    assert_equal @key.make_key_hash, @shift.key_hash
    assert_equal @offset.make_offset_hash, @shift.offset_hash
  end

  # def test_add_keys
  #   assert_equal @key, @shift.add_keys(@key)
  # end

  # def test_add_offsets
  #   assert_equal @offset, @shift.add_offsets(@offset)
  # end

  def test_can_combine_key_and_offset
    binding.pry
    assert_equal ({:A=>12, :B=>30, :C=>40, :D=>46}), @shift.combine
    assert_equal ({:A=>12, :B=>30, :C=>40, :D=>46}), @shift.shift_hash
  end




  # def test_can_add_alphabet
  #   expected  = ("a".."z").to_a << " "
  #   assert_equal expected,
  # end

end
