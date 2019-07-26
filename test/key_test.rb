require './test/test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_key_exists
    assert_instance_of Key, @key
  end

  def test_generate_random
    @key.stubs(:generate_random).returns("13579")
    assert_equal "13579", @key.generate_random
  end

  # def test_can_slice_number
  #   # skip
  #   key_1 = Key.new
  #   key_1.stubs(:generate_random).returns("12345")
  #   assert_equal [12, 23, 34, 45], key_1.slice_num
  # end

end
