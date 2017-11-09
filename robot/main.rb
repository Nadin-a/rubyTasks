require './interface'

interface = Interface.new

x = 0
y = 0
choice = 0

until choice == 1 || choice == 2
  puts 'Do you want to use 5x6 (press 1) or enter X and Y (press 2) ? '
  choice = gets.to_i
end

case choice
  when 1
    puts 'X = 5 Y = 6'
    x = 5
    y = 6
  when 2
    puts 'Enter size of table'
    until x.positive?
      puts 'Enter x: '
      x = gets.to_i
      p 'your X  ' + x.to_s
    end
    until y.positive?
      puts 'Enter y: '
      y = gets.to_i
      p 'your Y  ' + y.to_s
    end
end

command = ''

interface.create_table(x, y)

until interface.robot.coord > -1
  puts 'Place the robot! (PLACE X Y DIRECTION)'
  command = gets
  command.strip!
  command.upcase!
  interface.place_robot(command)
end


until command == 'END'
  puts 'Enter a command! (HELP for help, END for exit)'
  command = gets
  command.strip!
  command.upcase!
  interface.move_robot(command)
end