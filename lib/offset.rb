require 'date'

class Offset
  attr_reader :date, :offset_hash

  def initialize(date = current_date)
    @date = date
    @offset_hash = {}
  end

  def current_date
    cur_date = DateTime.now
    @date = cur_date.strftime("%d/%m/%y").gsub("/","")
  end

  def square_date
    (@date.to_i * @date.to_i).to_s
  end

  def make_keys
    square_date.split('')[-4..-1]
  end

  def make_offset_hash
    @offset_hash = {
      A: make_keys[0].to_i,
      B: make_keys[1].to_i,
      C: make_keys[2].to_i,
      D: make_keys[3].to_i,
    }
  end


end
