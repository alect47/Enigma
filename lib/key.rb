class Key
  attr_reader :given_key

  def initialize(given_key = "12345")
    @given_key = given_key
  end

  def generate_random
    random = (rand(1..100000)).to_s
    @given_key = ("0" * (5-(random.length)) + random)
  end

  def slice_num
    @given_key.to_s.split('')
  end

end
