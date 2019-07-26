require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_key_exists
    assert_instance_of Key, @key
  end

  def test_attributes
    assert_instance_of Integer, @key.random_num
  end

  def test_generate_random
    rando = @key.random_num
    @key.generate_random
    binding.pry
    refute rando == @key.random_num
  end

  def test_can_slice_number
    key_1 = Key.new(42743)
    assert_equal [42, 27, 74, 43], key_1.slice_num
  end

end
