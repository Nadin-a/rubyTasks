arr_height = [168, 186, 161, 176, 174]
arr_surname = %w[ Membran Fisher Warden Smith Lerman]
arr_height.each_with_index do |height, i|
  arr_surname.each_with_index do |surname, j|
    p surname if i == j && height == arr_height.max
  end
end

