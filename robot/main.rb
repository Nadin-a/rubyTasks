require './interface'

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

interface = Interface.new(x, y)


