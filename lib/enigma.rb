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

  def find_position(letter)
    alphabet.index(letter)
  end

  def letter_to_index(phrase)
    to_array(phrase).map do |let|
      find_position(let)
    end
  end

  def index_to_letter(arr)
    arr.map do |num|
      alphabet[num]
    end
  end

  def rotate_alphabet(num)
    @alphabet.rotate(num)
  end

  def use_shift_rotate
    hash = Hash.new(0)
    @shift.combine.each do |k, v|
      hash[k] = rotate_alphabet(v)
    end
    hash
  end

  def convert_shift_to_mod
    hash = Hash.new(0)
    @shift.combine.map do |k, v|
      hash[k] = (v %  27)
    end
    hash
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

end
