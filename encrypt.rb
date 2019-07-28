require './lib/enigma'
require './lib/helper'
require './lib/key'
require './lib/offset'
require './lib/shift'
require 'pry'

@enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

downcased_text = incoming_text
binding.pry

writer = File.open(ARGV[1], "w")
writer.write(encrypted_text)
writer.close
puts incoming_text
puts encrypted_text
