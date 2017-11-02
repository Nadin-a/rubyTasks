 ar = [0, 1, 0, 3, 4, 8, 0]
 ar1=[]
 ar2=[]

 ar.each_with_index do |elem, i|
   i.even?  ? ar1.push(ar[i]) : ar2.push(ar[i])
 end
 p 'Четные'
 ar1.each { |el| p el }
 p 'Нечетные'
 ar2.each { |el| p el }