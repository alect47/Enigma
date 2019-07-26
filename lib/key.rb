class Key
  attr_reader :random_num

  def initialize(random_num = (rand(1..100000)))
    @random_num = random_num
    @date_input = 021799
  end

  def generate_random
    @random_num = (rand(1..100000))
  end

end
