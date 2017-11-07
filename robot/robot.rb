class Robot

  attr_accessor :direction
  attr_accessor :coord

  def initialize
    @direction = '<'
    @coord = 00
  end

  def place(command_with_coord)
    command_with_coord = command_with_coord.split
    if command_with_coord.first != 'PLACE'
      p 'Error'
      return
    end
    command_with_coord.shift
    command_with_coord = command_with_coord.join
    @coord = command_with_coord.to_i
  end


  def choose_direction(side)
    @direction =
        case side
          when 'NORTH'
            '^'
          when 'SOUTH'
            'v'
          when 'EAST'
            '>'
          when 'WEST'
            '<'
          when 'RIGHT'
            '>'
          when 'LEFT'
            '<'
          else
            '-'
        end
  end

  def move(field)
    step = @coord
    case @direction
      when '^'
        step += 10
      when 'v'
        step -= 10
      when '>'
        step -= 1
      when '<'
        step += 1
    end
    @coord = step if field.field.map {|arr| arr.include?(step)}.include? true


  end

  def report
    p 'Coordinates'
    p @coord
    p 'Direction'
    p @direction
  end

end
