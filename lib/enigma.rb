require 'date'
require './lib/helper'

class Enigma
  include HelperMethods
  attr_reader :key, :offset, :shift, :alphabet

  def initialize
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @alphabet = ("a".."z").to_a << " "
  end

  def new_values(phrase)
    a = []
    letter_to_index(phrase).each_with_index do |num, index|
      # binding.pry
      if index % 4 == 0
        a << ((num + convert_shift_to_mod[:A]) % 27)
      elsif index % 4 == 1
        a << ((num + convert_shift_to_mod[:B]) % 27)
      elsif index % 4 == 2
        a << ((num + convert_shift_to_mod[:C]) % 27)
      elsif index % 4 == 3
        a << ((num + convert_shift_to_mod[:D]) % 27)
      end
    end
    a
  end

  def encrypt(message, key = @key.number , date = @offset.date)
    hash = {
    :encryption => (index_to_phrase(new_values(message))),
    :key => key,
    :date => date}
    hash
  end

end
