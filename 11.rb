array = [0, -4, 2, 5, 3, 2, 7, 8, 9, 10, -9]
indexes = []

array.each do |i|
  if i > 0
    indexes.push(array.index(i))
  end
end

p indexes