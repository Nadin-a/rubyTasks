array = [2, 5, 7, 6, 3, 8, 9, 100]

p array
min = array.min
max = array.max


min_index = 0
max_index = 0
array.each_with_index do |elem, index|
  case elem
  when min
    min_index = index
  when max
    max_index = index
  end
end

min_index += 1

sub_arr = array[min_index...max_index].reverse

p sub_arr
