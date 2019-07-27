require './test/test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_key_exists
    assert_instance_of Key, @key
  end

  def test_generate_random
    assert_equal 5, @key.generate_random.length
  end

  def test_new_number
    @key.stubs(:generate_random).returns("13579")
    assert_equal "13579", @key.new_number
  end

  def test_slice_number
    assert_equal ["1", "2", "3", "4", "5"], @key.slice_num
  end

  def test_make_key_hash
    @key.stubs(:slice_num).returns(["1","3","5","7","9"])
    expected = {
      A: 13,
      B: 35,
      C: 57,
      D: 79,
    }
    assert_equal expected, @key.make_key_hash
  end

end
