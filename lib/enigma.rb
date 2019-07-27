require 'date'

class Enigma
  attr_reader :key, :offset, :shift, :alphabet

  def initialize
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @alphabet = ("a".."z").to_a << " "
  end


end
