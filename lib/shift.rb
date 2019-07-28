require 'date'

class Shift
  attr_reader :key_hash, :offset_hash, :shift_hash

  def initialize(key, offset)
    @key_hash = key.make_key_hash
    @offset_hash = offset.make_offset_hash
    @shift_hash = {}
  end

  def combine
    @shift_hash = @key_hash.merge!(@offset_hash) {|k, v1, v2| v1 + v2}
  end



end
