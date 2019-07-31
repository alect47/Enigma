require 'date'
require './lib/enigma_helper'
require './lib/key_gen'

class Enigma
  include HelperMethods, KeyGen
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def make_shift_hash(key, offset)
    shift = Shift.new(Key.new(key), Offset.new(offset))
    shift.combine
    shift.shift_hash
  end

  def encrypted_values(phrase, key, offset)
    a = []
    shifts = mod_shift(key, offset)
    letter_to_index(phrase).each_with_index do |num, index|
      a << ((num + shifts[:A]) % 27) if (num.is_a? Integer) && index % 4 == 0
      a << ((num + shifts[:B]) % 27) if (num.is_a? Integer) && index % 4 == 1
      a << ((num + shifts[:C]) % 27) if (num.is_a? Integer) && index % 4 == 2
      a << ((num + shifts[:D]) % 27) if (num.is_a? Integer) && index % 4 == 3
      a << num if !num.is_a? Integer
    end
    a
  end

  def decrypted_values(phrase, key, offset)
    a = []
    shifts = mod_shift(key, offset)
    letter_to_index(phrase).each_with_index do |num, index|
      a << ((num - shifts[:A]) % 27) if (num.is_a? Integer) && index % 4 == 0
      a << ((num - shifts[:B]) % 27) if (num.is_a? Integer) && index % 4 == 1
      a << ((num - shifts[:C]) % 27) if (num.is_a? Integer) && index % 4 == 2
      a << ((num - shifts[:D]) % 27) if (num.is_a? Integer) && index % 4 == 3
      a << num if !num.is_a? Integer
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

  def find_keys(e_message, date)
    a = find_shift_of_last_four(e_message)
    count_up_keys.find do |key|
      decrypted = decrypt(e_message, key, date)
        decrypted[:decryption][a[:D][1]] == find_expected_last_four(e_message)[:D] &&
        decrypted[:decryption][a[:C][1]] == find_expected_last_four(e_message)[:C] &&
        decrypted[:decryption][a[:B][1]] == find_expected_last_four(e_message)[:B] &&
        decrypted[:decryption][a[:A][1]] == find_expected_last_four(e_message)[:A]
    end
  end

  def crack(e_message, date)
    key = find_keys(e_message, date)
    decrypt(e_message, key, date)
  end

end
