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
direction_of_robot = robot.choose_direction(command)

while true
  puts 'Enter a command!'
  command = gets
  command.sub!('\n', '')
  p command
  case command
    when 'MOVE'
      robot.move
    when 'REPORT'
      robot.report
    else
      direction_of_robot = robot.choose_direction(command)
  end
  field.show_field(robot.coord, direction_of_robot)
end

# puts 'Enter a command!'
# command = 'MOVE'
#
# robot.move if command == 'MOVE'
# robot.move if command == 'MOVE'
#
# field.show_field(robot.coord,direction_of_robot)
# p ' '
#
# command = 'LEFT'
# direction_of_robot = robot.choose_direction(command)
#
# command = 'MOVE'
# robot.move if command == 'MOVE'
#
# field.show_field(robot.coord,direction_of_robot)
#
# command = 'REPORT'
# robot.report if command == 'REPORT'