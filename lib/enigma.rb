require 'date'
require './lib/helper'

class Enigma
  # include HelperMethods
  attr_reader :alphabet, :key

  def initialize
    @key = Key.new
    # @offset = Offset.new
    # @shift = Shift.new(@key, @offset)
    @alphabet = ("a".."z").to_a << " "
  end

  def make_shift_hash(key, offset)
    shift = Shift.new(Key.new(key), Offset.new(offset))
    shift.combine
    shift.shift_hash
  end

  def to_array(phrase)
    phrase.split("")
  end

  def find_position(letter)
    alphabet.index(letter)
  end

  def letter_to_index(phrase)
    to_array(phrase).map do |let|
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
      else
        num
      end
    end.join
  end

  def rotate_alphabet(num)
    @alphabet.rotate(num)
  end

  def use_shift_rotate(key, offset)
    hash = Hash.new(0)
    make_shift_hash(key, offset).each do |k, v|
      hash[k] = rotate_alphabet(v)
    end
    hash
  end

  def convert_shift_to_mod(key, offset)
    hash = Hash.new(0)
    make_shift_hash(key, offset).map do |k, v|
      hash[k] = (v %  27)
    end
    hash
  end

  def encrypted_values(phrase, key, offset)
    a = []
    letter_to_index(phrase).each_with_index do |num, index|
      if (num.is_a? Integer) && index % 4 == 0
        a << ((num + convert_shift_to_mod(key, offset)[:A]) % 27)
      elsif (num.is_a? Integer) && index % 4 == 1
        a << ((num + convert_shift_to_mod(key, offset)[:B]) % 27)
      elsif (num.is_a? Integer) && index % 4 == 2
        a << ((num + convert_shift_to_mod(key, offset)[:C]) % 27)
      elsif (num.is_a? Integer) && index % 4 == 3
        a << ((num + convert_shift_to_mod(key, offset)[:D]) % 27)
      else
        a << num
      end
    end
    a
  end

  def decrypted_values(phrase, key, offset)
    a = []
    letter_to_index(phrase).each_with_index do |num, index|
      if (num.is_a? Integer) && index % 4 == 0
        a << ((num - convert_shift_to_mod(key, offset)[:A]) % 27)
      elsif (num.is_a? Integer) && index % 4 == 1
        a << ((num - convert_shift_to_mod(key, offset)[:B]) % 27)
      elsif (num.is_a? Integer) && index % 4 == 2
        a << ((num - convert_shift_to_mod(key, offset)[:C]) % 27)
      elsif (num.is_a? Integer) && index % 4 == 3
        a << ((num - convert_shift_to_mod(key, offset)[:D]) % 27)
      else
        a << num
      end
    end
    a
  end

  def encrypt(message, key = Key.new.number , date = Offset.new.date)
    hash = {
    :encryption => (index_to_phrase(encrypted_values(message, key, date))),
    :key => key,
    :date => date}
    hash
  end

  def decrypt(message, key = Key.new.number , date = Offset.new.date)
    hash = {
    :decryption => (index_to_phrase(decrypted_values(message, key, date))),
    :key => key,
    :date => date}
    hash
  end

  def find_last_four(message)
    message[-4..-1]
  end

  def count_up_keys
    range = (0..99)
    number = "00"
    number_2 = []
    range.each do |n|
      @key.number = "000" + ("0" * (2 - n.to_s.length) + n.to_s)
      n += 1
    end
    @key.number
  end

  def count_up_keys
    range = (0..99)
    number_2 = []
    range.each do |n|
      number_2 << ("000" + ("0" * (2 - n.to_s.length) + n.to_s))
      n += 1
    end
    number_2
  end

  def find_shift_of_last_four(message)
    a = message.split("")
    b = {}
    a.each_with_index do |let, index|
      if index % 4 == 3
        b[:D] = [let, index]
      elsif index % 4 == 2
        b[:C] = [let, index]
      elsif index % 4 == 1
        b[:B] = [let, index]
      elsif index % 4 == 0
        b[:A] = [let, index]
      end
    end
    b
  end

  def order_last_four(message)
    a = find_shift_of_last_four(message)
    c = a.sort_by do |k, v|
      v[1]
    end
    # d = {}
    # c.each do |n|
    #   d[n[0]] = n[1]
    # end
    # d
  end

  def find_expected_last_four(message)
    b = [" ", "e", "n", "d"]
    a = {}
    order_last_four(message).each_with_index do |n, index|
      a[n[0]] = b[index]
    end
    a
  end

  #   a[:D]
  # end

  def cycle_through_keys(e_message, date)
    #this will return an array with ["h", 11]

    a = find_shift_of_last_four(e_message)
    count_up_keys.find do |key|
      decrypted = decrypt(e_message, key, date)
        decrypted[:decryption][a[:D][1]] == " "
    end
  end


end
# def find_key_letter_at_last_d(message)
#   a = message.split("")
#   b = {}
#   a.each_with_index do |let, index|
#     if index % 4 == 3
#       b[let] = index
#     end
#   end
#   b.max_by do |k, v|
#     v
#   end
# end
