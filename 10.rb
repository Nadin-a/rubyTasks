a = (1...15).to_a
a.delete(a.first)
p 'В порядке убывания'
p a.reverse!
p 'Размер'
p a.size