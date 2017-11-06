arr = [3, -6, 3, -5, 6, -4]
if arr[0..-2].map.with_index {|item, index| item.positive? && arr[index + 1].negative? || item.negative? && arr[index + 1].positive?}.include? false
  p 'Не чередуются'
else
  p 'Чередуются'
end

