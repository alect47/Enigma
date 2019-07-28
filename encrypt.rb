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

encrypted_text = @enigma.encrypt(incoming_text.strip)
# binding.pry

writer = File.open(ARGV[1], "w")
writer.write(encrypted_text[:encryption])
writer.close
puts incoming_text
puts encrypted_text
