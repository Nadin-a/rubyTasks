puts 'Hello. Please enter a number: '
num = gets.to_s.strip
arr = num.split('')
p arr.count {|i| i == arr.max}


