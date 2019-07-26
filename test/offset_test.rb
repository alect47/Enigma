require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require 'pry'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_offset_exists
    assert_instance_of Offset, @offset
  end

  def test_can_find_current_date
    @offset.current_date
    assert_equal 250719, @offset.date
  end


end
