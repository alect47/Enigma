class Key
  attr_reader :number

    def initialize(number = "12345")
      @number = number
    end

  def generate_random
    random = (rand(1..100000)).to_s
    @number = ("0" * (5-(random.length)) + random)
  end

  def slice_num
    @number.to_s.split('')
  end

end
