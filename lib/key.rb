class Key
  attr_reader :random_num

  def initialize(random_num = (rand(1..100000)))
    @random_num = random_num
    @date_input = 121799
  end

  def generate_random
    random = (rand(1..100000)).to_s
    @random_num = ("0" * (5-(random.length)) + random)
  end

  def slice_num
    @random_num.to_s.split('')
  end

end
