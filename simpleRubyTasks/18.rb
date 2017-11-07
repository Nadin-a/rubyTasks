words = 'this is my array this is array full of words'.split
# p words.group_by { |word| words.count(word) }


#p words.group_by(&:capitalize).map{|k,v|  [k, v.count]}.to_h

p words.inject(Hash.new(0)) { |h, e| h[e.capitalize] += 1 ; h }
