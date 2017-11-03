puts 'Hello. Please enter a number: '
num = gets.to_s.strip
arr = num.split('')
max = arr.max
p arr.count { |i| i == max }
