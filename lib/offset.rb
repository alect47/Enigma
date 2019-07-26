require 'date'

class Offset
  attr_reader :date

  def initialize(date = 250718)
    @date = date
  end

  def current_date
    cur_date = DateTime.now
    @date = cur_date.strftime("%d/%m/%y").gsub("/","").to_i
  end

  def square_date
    @date * @date
  end

  def make_keys
    square_date.to_s.split('')[-4..-1].map(&:to_i)
  end



end
