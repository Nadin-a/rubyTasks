class Table
  attr_accessor :height, :width

  def initialize(x, y)
    @height = x
    @width = y
  end

  def check_borders?(robot_x, robot_y) 
    robot_x < @height && robot_y < @width && (robot_x.positive? || robot_x == 0) && (robot_y.positive? || robot_y == 0)
  end

end

