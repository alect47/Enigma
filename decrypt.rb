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

decrypted_text = @enigma.decrypt(incoming_text.strip, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted_text[:decryption])
writer.close
puts "Created #{ARGV[1]} with the key #{decrypted_text[:key]} and the date #{decrypted_text[:date]}"
