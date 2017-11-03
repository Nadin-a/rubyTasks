R = 7.8681
arr = [2.646, 4.23423, 7.8678, 7.8679, 0.7867, 43.21312, 1, 76.54354, 0.6546, 3.7, -16.2, 3.00001, 6.4234, 98.3, 18.999999]
res = 0
min = R.abs
arr.each do |elem|
    if (R - elem).abs < min
      min = (R - elem).abs
      res = elem
    end
end

p res
