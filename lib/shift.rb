require 'date'

class Shift
  attr_reader :key, :offset

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def add_keys(key_1)
    @key = key_1
  end

  def add_offsets(offset_1)
    @offset = offset_1
  end

  def combine
    @key.key_hash.merge!(@offset.offset_hash) {|k, v1, v2| v1 + v2}
  end



end
