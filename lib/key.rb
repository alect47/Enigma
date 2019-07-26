class Key
  attr_reader :number, :key_hash

    def initialize(number = "12345")
      @number = number
      @key_hash = Hash.new(0)
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
      :a => slice_num[0..1].join,
      :b => slice_num[1..2].join,
      :c => slice_num[2..3].join,
      :d => slice_num[3..4].join,
    }
  end

end
