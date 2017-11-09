require './robot'
require './table'

class Interface

  attr_accessor :robot
  attr_accessor :table

  def initialize
    @robot = Robot.new
  end

  def create_table(x, y)
    @table = Table.new(x, y)
  end

  def place_robot(command)
    command = check_correctness(command)
    if command.is_a? Array
      coord_r = command[0..1].join.to_i
      coord_x = @table.coord_x
      coord_y = @table.coord_y
      if @table.check_position(coord_r)
        @robot.place(command)
      else
        p 'robot in`t on the table'
        robot.coord = -1
      end
    end
  end


  def move_robot(command)
    case command
      when 'MOVE'
        @robot.move(@table)
      when 'REPORT'
        @robot.report
      when 'RIGHT', 'LEFT'
        @robot.change_direction(command)
      when 'HELP'
        p 'try MOVE/REPORT/RIGHT/LEFT'
      else
        p 'Uncorrect command'
    end
  end

  private

  def check_correctness(command_with_coord)
    command_with_coord = command_with_coord.split
    errors = ''
    unless command_with_coord.first == 'PLACE'
      errors += 'First word must be place. '
    end
    unless command_with_coord.size == 4
      errors += 'Uncorrect format of command. Try (PLACE X Y DIRECTION) '
    end
    unless %w[NORTH EAST SOUTH WEST].include?(command_with_coord.last) #!!!!!!!!!!!!!!!!!!11
      errors += 'Direction must be NORTH or EAST or SOUTH or WEST '
    end

    if errors.empty?
      command_with_coord.shift
      command_with_coord
    else
      p errors
      errors
    end
  end


end

