def formatize(str, type)
  str = str.split
  case type
  when :camel
    str.map(&:capitalize).join
  when :underscore
    str.map(&:downcase).join('_')
  when :css
    str.map(&:downcase).join('-')
  end
end

p formatize('i love ruby', :camel)
p formatize('i love ruby', :underscore)
p formatize('i love ruby', :css)
