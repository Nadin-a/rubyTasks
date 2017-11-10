class Robot

  SIDES = %w[NORTH EAST SOUTH WEST].freeze

  attr_accessor :coord, :direction

  def initialize(param)
    @coord = {x: param[:x], y: param[:y]}
    @direction = param[:dir]
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

  def move
    @coord = next_step
  end

  def next_step
    step_x = @coord[:x]
    step_y = @coord[:y]

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
    coord = {x: step_x, y: step_y}
  end

  def report
    p coord[:x].to_s + ' : ' + coord[:y].to_s + ' '+ @direction
  end

end
