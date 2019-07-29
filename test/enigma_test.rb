require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_attributes
    assert_equal ("a".."z").to_a << " ", @enigma.alphabet
  end

  def test_make_shift_hash
    assert_equal ({:A=>12, :B=>30, :C=>40, :D=>46}), @enigma.make_shift_hash("12345", "280819")
  end

  def test_convert_message_to_array
    expected = ["H", "i", " ", "h", "e", "l", "l", "o", "!"]
    assert_equal expected, @enigma.to_array("Hi hello!")
  end

  def test_find_alphabet_index
    assert_equal 7, @enigma.find_position("h")
  end

  def test_convert_letter_to_index
    assert_equal [7, 8, 26, 7, 4, 11, 11, 14, "!"], @enigma.letter_to_index("Hi hello!")
  end

  def test_convert_index_to_phrase
    assert_equal "hi hello!", @enigma.index_to_phrase([7, 8, 26, 7, 4, 11, 11, 14, "!"])
  end

  def test_rotate_alphabet
    assert_equal "d", @enigma.rotate_alphabet(3)[0]
  end

  def test_use_shift_to_rotate_alphabet
    assert_equal "m", @enigma.use_shift_rotate("12345", "280819")[:A][0]
  end

  def test_convert_shift_to_mod
    expected = {:A=>12, :B=>3, :C=>13, :D=>19}
    assert_equal expected, @enigma.convert_shift_to_mod("12345", "280819")
  end

  def test_encrypt_values
    assert_equal [19, 11, 12, 26, 16, 14, 24, 6, "!"], @enigma.encrypted_values("Hi hello!", "12345", "280819")
  end

  def test_decrypt_values
    assert_equal [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3, "!"], @enigma.decrypted_values("keder ohulw!", "02715", "040895")
  end

  def test_encrypt
    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("Hello world!", "02715", "040895")
  end

  def test_decrypt
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_encrypt_with_no_date
    expected = {
      encryption: "pnhawisdzu ",
      key: "02715",
      date: "280719"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_with_no_date_or_key
    assert_instance_of Hash, @enigma.encrypt("hello world")
  end

  def test_decrypt_no_date
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "280719"
    }
    encrypted = @enigma.encrypt("hello world", "02715")
    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_find_last_four
    assert_equal "sage", @enigma.find_last_four("this message")
  end

  def test_count_up_keys
    assert_instance_of Array, @enigma.count_up_keys
  end

  def test_find_shift_of_last_four
    assert_equal "", @enigma.find_shift_of_last_four("vjqtbeawesjjsjsdfkjhfdfi")
  end

  def test_cycle_through_keys
    @enigma.encrypt("hello world end", "08304", "291018")
    # binding.pry
    assert_equal "", @enigma.cycle_through_keys("vjqtbeaweqihssi", "291018")
  end

  def test_order_last_four
    assert_equal "", @enigma.order_last_four("vjqtbeaweqsdfsdfihhsdsi")
  end

  def test_find_expected_last_four
    assert_equal "", @enigma.find_expected_last_four("vjqtbeaweqsdfsdfihhsdsi")
  end

  # def test_find_key_letter_at_last_d
  #   assert_equal "", @enigma.find_key_letter_at_last_d("vjqtbdjheaweqihjssi")
  # end


  end
