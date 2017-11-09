class Robot

  SIDES = %w[NORTH EAST SOUTH WEST].freeze

  attr_accessor :coord
  attr_accessor :direction

  def initialize
    @coord = -1
    @direction = 'NORTH'
  end

  def place(array_with_info)
    @direction = array_with_info.last
    array_with_info.delete_if {|item| item == array_with_info.last}
    @coord = array_with_info.join.to_i
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
    step = @coord
    case @direction
      when 'NORTH'
        step += 1
      when 'EAST'
        step += 10
      when 'SOUTH'
        step -= 1
      when 'WEST'
        step -= 10
    end

    if table.check_position(step)
      @coord = step
    else
      p 'BORDER'
    end
  end

  def report
    p @coord < 10 ? '0:' + @coord.to_s : @coord.to_s.split('').join(':').to_s + ' ' + @direction
  end


end
