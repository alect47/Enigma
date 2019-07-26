require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'
require 'pry'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_shift_has_attributes
    assert_equal "c", @shift.alphabet[2]
    #if start with zero get invalid octal digit error
    assert_equal 12439, @shift.key
    assert_equal 250819, @shift.offset
  end

  

  # def test_can_add_alphabet
  #   expected  = ("a".."z").to_a << " "
  #   assert_equal expected,
  # end

end
