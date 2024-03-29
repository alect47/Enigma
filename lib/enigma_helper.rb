module HelperMethods

  def find_position(letter)
    alphabet.index(letter)
  end

  def letter_to_index(phrase)
    phrase.split("").map do |let|
      if @alphabet.include?(let.downcase)
        find_position(let.downcase)
      else
        let = let
      end
    end
  end

  def index_to_phrase(arr)
    arr.map do |num|
      if num.is_a? Integer
        alphabet[num]
      else num
      end
    end.join
  end

  def rotate_alphabet(num)
    @alphabet.rotate(num)
  end

  def make_new_alphabets(key, offset)
    hash = Hash.new(0)
    make_shift_hash(key, offset).each do |k, v|
      hash[k] = rotate_alphabet(v)
    end
    hash
  end

  def mod_shift(key, offset)
    hash = Hash.new(0)
    make_shift_hash(key, offset).map do |k, v|
      hash[k] = (v %  27)
    end
    hash
  end

  def count_up_keys
    range = (0..99999)
    number_2 = []
    range.each do |n|
      number_2 << ("0" * (5 - n.to_s.length) + n.to_s)
      n += 1
    end
    number_2
  end

  def find_shift_of_last_four(message)
    a = message.split("")
    b = {}
    a.each_with_index do |let, index|
      b[:D] = [let, index] if index % 4 == 3
      b[:C] = [let, index] if index % 4 == 2
      b[:B] = [let, index] if index % 4 == 1
      b[:A] = [let, index] if index % 4 == 0
    end
    b
  end

  def order_last_four(message)
    a = find_shift_of_last_four(message)
    a.sort_by do |k, v|
      v[1]
    end
  end

  def find_expected_last_four(message)
    b = [" ", "e", "n", "d"]
    a = {}
    order_last_four(message).each_with_index  {|n, index| a[n[0]] = b[index]}
    a
  end

end
