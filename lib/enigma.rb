require 'date'

class Enigma
  attr_reader :key, :offset, :shift, :alphabet

  def initialize
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new(@key, @offset)
    @alphabet = ("a".."z").to_a << " "
  end

  def to_array(phrase)
    phrase.split("")
  end

  def rotate_alphabet(num)
    @alphabet.rotate(num)
  end

  def use_shift_rotate
    hash = Hash.new(0)
    @shift.combine.each do |k, v|
      # binding.pry
      hash[k] = rotate_alphabet(v)
    end
    hash
  end

end
