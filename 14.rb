puts 'Hello. Please enter a number: '
num = gets.to_s
arr = num.split('')
p arr.count {|i| i == arr.max}


