arr = [3, 7, 9, -65, 4, 43, -7, 9, 4, 3, 2, 1]
p arr.detect { |item| arr[0] < item && item < arr[-1] } || []
