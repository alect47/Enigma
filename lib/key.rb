class Key
  attr_reader :number, :key_hash

    def initialize(number = new_number)
      @number = number
      @key_hash = make_key_hash
    end

  def generate_random
    random = (rand(1..100000)).to_s
    ("0" * (5-(random.length)) + random)
  end

  def new_number
    random = (rand(1..100000)).to_s
    @number = generate_random("0" * (5-(random.length)) + random)
  end

  def slice_num
    @number.split('')
  end

  def make_key_hash
    @key_hash = {
      A: slice_num[0..1].join.to_i,
      B: slice_num[1..2].join.to_i,
      C: slice_num[2..3].join.to_i,
      D: slice_num[3..4].join.to_i,
    }
  end

end
