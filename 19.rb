text = 'Дан текст. Заменить все , на . и наоборот..'.split('')

text.map! do |ch|
  if ch == ','
    '.'
  elsif ch == '.'
    ','
  else
    ch
  end
end
p text.join
