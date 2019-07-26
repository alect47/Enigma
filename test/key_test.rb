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
end
