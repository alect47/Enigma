class Shift
  attr_reader :alphabet, :key, :offset

  def initialize(key = 12439, offset = 250819)
    @alphabet = ("a".."z").to_a << " "
    @key = key
    @offset = offset
  end

end
