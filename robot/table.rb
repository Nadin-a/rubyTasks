class Table
  attr_accessor :coord_x
  attr_accessor :coord_y

  def initialize(x, y)
    @coord_x = x
    @coord_y = y
  end

  def check_position(coord)
    (coord.positive? || coord == 0) && coord < @coord_x * 10 && coord % 10 != @coord_y && coord % 10 <= @coord_y-1
  end

end

