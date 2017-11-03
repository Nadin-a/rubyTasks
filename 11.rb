array = [-7, -4, 2, 5, 3, -2, 7, 8, 9, 10, -9]

array.each do |elem|
  if elem > 0
    array.insert(array.index(elem)+1, 0)
  end
end



