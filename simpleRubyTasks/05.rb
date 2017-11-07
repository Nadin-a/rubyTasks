array = [2, -500, 7, 6, 3, 125, 9]
min_index = array.index(array.min)
max_index = array.index(array.max)
sub_arr = if min_index > max_index
            array[(max_index + 1)...min_index]
          else
            array[(min_index + 1)...max_index]
          end

p sub_arr.reverse
