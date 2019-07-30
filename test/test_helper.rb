require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/enigma'
require './lib/offset'
require './lib/shift'
require './lib/enigma_helper'
require './lib/key_gen'
require 'pry'
require 'mocha/minitest'
