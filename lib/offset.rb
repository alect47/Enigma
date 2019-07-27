require 'date'

class Offset
  attr_reader :date

  def initialize(date = "250719")
    @date = date
  end

  def current_date
    cur_date = DateTime.now
    @date = cur_date.strftime("%d/%m/%y").gsub("/","")
  end

  def square_date
    (@date.to_i * @date.to_i).to_s
  end

  def make_keys
    square_date.split('')[-4..-1].map(&:to_i)
  end



end
