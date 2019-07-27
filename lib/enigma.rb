require 'date'

class Enigma
  attr_reader :key, :offset, :shift

  def initialize
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
  end
end
