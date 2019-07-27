require './test/test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_offset_exists
    assert_instance_of Offset, @offset
  end

  def test_can_find_current_date
    @offset.stubs(:date).returns("260719")
    assert_equal "260719", @offset.date
  end

  def test_can_square_date
    # @offset.stubs(:current_date).returns("260719")
    # @offset.stubs(:date).returns("260719")

    # binding.pry
    assert_equal "73288776961", @offset.square_date
  end

  def test_can_take_make_keys
    @offset.stubs(:square_date).returns("47616614321")
    assert_equal [4,3,2,1], @offset.make_keys
  end

  def test_make_offset_hash
    @offset.stubs(:make_keys).returns([4,3,2,1])
    expected =  {
      A: 4,
      B: 3,
      C: 2,
      D: 1,
    }
    assert_equal expected, @offset.make_offset_hash
  end


end
