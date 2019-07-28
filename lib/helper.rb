module HelperMethods

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


    def index_to_phrase(arr)
      arr.map do |num|
        alphabet[num]
      end.join
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


end
