puts "Hello. Please enter a radius: "

r = gets.to_i
y = r
r_in = r-0.4
r_out = r+0.4

until y < -r do
  x = -r
  until x >= r_out do
    if x*x + y*y >= r_in*r_in && x*x + y*y <= r_out*r_out
      print '*'
    else
      print ' '
    end
    x += 0.5
  end
  print "\n"
  y -= 1
end
