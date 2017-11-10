class Robot

  SIDES = %w[NORTH EAST SOUTH WEST].freeze

  attr_accessor :robot_x, :robot_y, :direction

  def initialize(robot_x, robot_y, direction)
    @robot_x = robot_x
    @robot_y = robot_y
    @direction = direction
  end

  def change_direction(rotation)
    previous_value = SIDES[SIDES.index(@direction)-1]
    next_value = SIDES[SIDES.index(@direction)+1]
    case rotation
      when 'LEFT'
        @direction = previous_value
      when 'RIGHT'
        @direction = next_value.nil? ? SIDES[0] : next_value
    end
  end

  def move(table)
    step_x = @robot_x
    step_y = @robot_y
    case @direction
      when 'NORTH'
        step_y += 1
      when 'EAST'
        step_x += 1
      when 'SOUTH'
        step_y -= 1
      when 'WEST'
        step_x -= 1
    end
    check_borders(table, step_x, step_y)
  end

  def report
    @robot_x.to_s + ' ' + @robot_y.to_s + ' '+ @direction
  end

  private

  def check_borders(table, step_x, step_y)
    if table.check_borders(step_x, step_y)
      @robot_x = step_x
      @robot_y = step_y
    else
      p 'BORDER'
    end
  end
end
