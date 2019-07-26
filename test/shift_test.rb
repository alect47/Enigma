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

  def test_has_alpahbet
    assert_equal "c", @shift.alphabet[2]
    assert_equal " ", @shift.alphabet[26]
  end

  # def test_can_add_alphabet
  #   expected  = ("a".."z").to_a << " "
  #   assert_equal expected,
  # end

end
