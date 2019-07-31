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


  def test_encrypted_values
    assert_equal [19, 11, 12, 26, 16, 14, 24, 6, "!"], @enigma.encrypted_values("Hi hello!", "12345", "280819")
  end

  def test_decrypted_values
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
      :encryption=>"pnhawisdzu ", :key=>"02715", :date=>"310719"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_encrypt_with_no_date_or_key
    assert_instance_of Hash, @enigma.encrypt("hello world")
  end

  def test_decrypt_no_date
    encrypted = @enigma.encrypt("hello world", "02715")
    assert_equal "hello world", @enigma.decrypt(encrypted[:encryption], "02715")[:decryption]
  end

  def test_find_keys
    @enigma.encrypt("hello world end", "08304", "291018")
    assert_equal "08304", @enigma.find_keys("vjqtbeaweqihssi", "291018")
  end


  def test_crack
    @enigma.encrypt("hello world end", "08304", "291018")
    expected = {:decryption=>"hello world end", :key=>"08304", :date=>"291018"}
    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end


end
