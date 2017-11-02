puts 'Hello. Please enter a size of aray: '
size = gets.to_i

size.times do |i|
  row = ''
  size.times do |j|
    row += i == j ? '1' : '0'
  end
  puts row
end

