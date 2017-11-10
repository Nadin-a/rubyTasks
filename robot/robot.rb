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
    @coord = check_next_position
  end

  def check_next_position
    next_x = @coord[:x]
    next_y = @coord[:y]

    case @direction
      when 'NORTH'
        next_y += 1
      when 'EAST'
        next_x += 1
      when 'SOUTH'
        next_y -= 1
      when 'WEST'
        next_x -= 1
    end
    position = {x: next_x, y: next_y}
  end

  def report
    p coord[:x].to_s + ' : ' + coord[:y].to_s + ' '+ @direction
  end

end
