 ar = [0, 1, 0, 3, 4, 8, 0]
 ar1=[]
 ar2=[]

 ar.each_with_index do |elem, index|
  index.even? ? ar1.push(elem) : ar2.push(elem)
 end
 p 'Четные'
 p ar1
 p 'Нечетные'
 p ar2
