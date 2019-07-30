class Shift
  attr_reader :key, :offset, :shift_hash

  def initialize(key, offset)
    @key = key
    @offset = offset
    @shift_hash = {}
  end

  def combine
    @shift_hash = @key.make_key_hash
      .merge!(@offset.make_offset_hash) {|k, v1, v2| v1 + v2}
  end

end
