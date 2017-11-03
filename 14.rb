puts 'Hello. Please enter a number: '
num = gets.to_s
arr = []
num.each_char {|c| arr << c.to_i }
p arr.count { |i| i == arr.max}


