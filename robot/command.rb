require './robot'

class Command

  attr_accessor :name, :args

  def initialize(args)
    @name = args.first
    @args = args
  end

  def validate?(robot, table)
    case @name
    when 'PLACE'
      validate_place?(robot, table)
    when 'MOVE', 'REPORT', 'LEFT', 'RIGHT', 'HELP', 'EXIT'
      robot && table ? true : false
    else
      p 'Uncorrect command'
      false
    end
  end

  private

  def validate_place?(robot, table)
    if !robot && table
      errors = ''
      if @args.size == 4
        unless @args[1].match(/[0-9]+/) || @args[2].match(/[0-9]+/)
          errors += 'X and/or Y must be numbers. '
        end
      else
        errors += 'Uncorrect format of command. Try (PLACE X Y DIRECTION).  '
      end
      unless Robot::SIDES.include?(@args.last)
        errors += 'Direction must be NORTH or EAST or SOUTH or WEST. '
      end

      if errors.empty?
        true
      else
        p errors
        false
      end
    else
      p 'Robot on the table yet'
    end
  end

end