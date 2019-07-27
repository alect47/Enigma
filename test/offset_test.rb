require './test/test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_offset_exists
    assert_instance_of Offset, @offset
  end

  def test_can_find_current_date
    @offset.current_date
    assert_equal "260719", @offset.date
  end

  def test_can_square_date
    # @offset.stubs(:current_date).returns("260719")
    
    assert_equal "62860016961", @offset.square_date
  end

  def test_can_take_make_keys
    assert_equal [5,5,2,4], @offset.make_keys
  end


end
