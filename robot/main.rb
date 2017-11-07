require './robot'
require './field'

robot = Robot.new
field = Field.new


puts 'Hello. Enter your command'

puts 'Place the robot! (PLACE X Y)'
command = 'PLACE 0 1' #gets
robot.place(command)

puts 'Specify direction (NORTH, SOUTH, EAST, WEST)'
command = gets
command.strip!
direction_of_robot = robot.choose_direction(command)

while true
  puts 'Enter a command!'
  command = gets
  command.strip!
  p robot.coord
  case command
    when 'MOVE'
      p 'im move'
      robot.move
    when 'REPORT'
      p 'im report'
      robot.report
    else
      direction_of_robot = robot.choose_direction(command)
  end
  field.show_field(robot.coord, direction_of_robot)
end
