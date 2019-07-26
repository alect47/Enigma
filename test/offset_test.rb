require './test/test_helper'
# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/offset'
# require 'pry'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_offset_exists
    assert_instance_of Offset, @offset
  end

  def test_can_find_current_date
    @offset.current_date
    assert_equal 260719, @offset.date
  end

  def test_can_square_date
    assert_equal 62859515524, @offset.square_date
  end

  def test_can_take_make_keys
    assert_equal [5,5,2,4], @offset.make_keys
  end


end
