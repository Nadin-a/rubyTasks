require './robot'
require './table'

class Interface

  attr_accessor :robot, :table

  def initialize(x, y)
    @table = Table.new(x, y)
    read
  end

  private

  def read
    p 'Enter your command'
    p 'Help: ' + (robot.nil? ? 'Place the robot! (PLACE X Y DIRECTION)' : 'Move robot! MOVE/REPORT/RIGHT/LEFT')
    command = gets
    command.strip!
    command.upcase!
    if validate(command)
      execute(command)
    else
      read
    end
  end

  def execute(command)
    p 'Execution command: ' + command
    unless @robot.nil?
      case command
        when 'MOVE'
          step
        when 'REPORT'
          @robot.report
        when 'RIGHT', 'LEFT'
          @robot.change_direction(command)
        when 'HELP'
          p 'try MOVE/REPORT/RIGHT/LEFT'
        when 'EXIT'
          system.exit!
        else
          p 'Uncorrect command'
      end
    else
      command = command.split
      information = {x: command[1].to_i, y: command[2].to_i, dir: command[3]}
      place_robot(information)
    end
    read
  end

  def step
    if @table.check_borders? @robot.next_step
      @robot.move
    else
      p 'BORDER'
    end
  end

  def validate(command)
    if robot.nil?
      command = command.split
      errors = ''
      unless command.first == 'PLACE'
        errors += 'First word must be place. '
      end
      unless command.size == 4
        errors += 'Uncorrect format of command. Try (PLACE X Y DIRECTION) '
      end
      unless Robot::SIDES.include?(command.last)
        errors += 'Direction must be NORTH or EAST or SOUTH or WEST '
      end

      if errors.empty?
        true
      else
        p errors
        false
      end
    else
      true
    end
  end

  def place_robot(param = {})
    if @table.check_borders?(param)
      @robot = Robot.new(param)
      p 'Robot on table!'
    else
      p 'Robot in`t on the table'
    end
  end



end

