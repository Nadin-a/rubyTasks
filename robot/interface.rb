require './robot'
require './table'
require './command'

class Interface

  attr_accessor :robot, :table, :command

  def initialize(x, y)
    @table = Table.new(x, y)
    read
  end

  private

  def read
    p 'Enter your command'
    p 'Help: ' + (robot.nil? ? 'Place the robot! (PLACE X Y DIRECTION)' : 'Move robot! MOVE/REPORT/RIGHT/LEFT')
    @command = Command.new(gets.strip.upcase.split)
    if @command.validate?(!@robot.nil?, !@table.nil?)
      execute
    else
      read
    end
  end

  def execute
    p 'Execution command: ' + @command.name
    case @command.name
      when 'PLACE'
        if robot.nil?
          information = {x: @command.args[1].to_i, y: @command.args[2].to_i, dir: @command.args[3]}
          place_robot(information)
        end
      when 'MOVE'
        step
      when 'REPORT'
        @robot.report
      when 'RIGHT', 'LEFT'
        @robot.change_direction(@command.name)
      when 'HELP'
        p 'try MOVE/REPORT/RIGHT/LEFT'
      when 'EXIT'
        system.exit!
    end
    read
  end

  def step
    if @table.check_borders? @robot.check_next_position
      @robot.move
    else
      p 'BORDER'
    end
  end

  def place_robot(position)
    if @table.check_borders?(position)
      @robot = Robot.new(position)
      p 'Robot on table!'
    else
      p 'Robot in`t on the table'
    end
  end

end

