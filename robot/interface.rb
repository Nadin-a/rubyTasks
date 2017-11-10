require './robot'
require './table'

# + read
# - execute


class Interface

  attr_accessor :robot

  def initialize(x, y)
    @table = Table.new(x, y)
    get_command_to_place
    read_command
  end

  def get_command_to_place
    command = ''
    while @robot.nil?
      puts 'Place the robot! (PLACE X Y DIRECTION)'
      command = gets
      command.strip!
      command.upcase!
      place_robot(command)
    end
  end

  def read_command
    command = ''
    until command == 'END'
      puts 'Enter a command! (HELP for help, END for exit)'
      command = gets
      command.strip!
      command.upcase!
      move_robot(command)
    end
  end

  private

  def place_robot(command)
    command = check_correctness(command)
    if command.is_a? Array
      robot_x = command[0].to_i
      robot_y = command[1].to_i
      dir = command[2]
      if @table.check_borders(robot_x, robot_y)
        @robot = Robot.new(robot_x, robot_y, dir)
      else
        p 'robot in`t on the table'
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

