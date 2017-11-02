array = [2, 5, 7, 6, 3, 8, 9, 100]

p array
min = array.min
max = array.max


min_index = array.index(array.min)
max_index = array.index(array.max)

min_index += 1

sub_arr = array[min_index...max_index].reverse

p sub_arr
