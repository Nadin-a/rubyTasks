class Table
  attr_accessor :height, :width

  def initialize(x, y)
    @height = x
    @width = y
  end
  
  def check_borders?(coord = {})
    coord[:x] < @height && coord[:y] < @width && (coord[:x].positive? || coord[:x] == 0) && (coord[:y].positive? || coord[:y] == 0)
  end

end

