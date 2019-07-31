require './lib/enigma'
require './lib/enigma_helper'
require './lib/key'
require './lib/offset'
require './lib/shift'
require 'pry'

@enigma = Enigma.new

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

cracked_text = @enigma.crack(incoming_text.strip, ARGV[2])


writer = File.open(ARGV[1], "w")
writer.write(cracked_text[:decryption])
writer.close
puts "Created #{ARGV[1]} with the key #{cracked_text[:key]} and the date #{cracked_text[:date]}"
