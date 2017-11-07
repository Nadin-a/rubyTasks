 arr = [0, 1, 0, 3, 4, 8, 0]

 splitted = arr.partition {|item| arr.index(item).even?}

 p 'Четные'
 p splitted.first
 p 'Нечетные'
 p splitted.last
