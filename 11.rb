array = [-7, -4, 2, 5, 3, -2, 7, 8, 9, 10, -9]
new_arr = []
array.each do |elem|
  new_arr.push(elem)
  new_arr.push(0) if elem.positive?
end
p new_arr
