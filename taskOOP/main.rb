require './fixed_employee'
require './hourly_employee'

# empl_list = [
#     FixedEmployee.new('Jane', 8000), HourlyEmployee.new('Ron', 45),
#     FixedEmployee.new('Stan', 8700), HourlyEmployee.new('Beverly', 70),
#     HourlyEmployee.new('Jim', 35), FixedEmployee.new('Iren', 6750),
#     FixedEmployee.new('Bill', 8700), HourlyEmployee.new('Susan', 60),
#     HourlyEmployee.new('John', 45), FixedEmployee.new('Kate', 7500)
# ]

def search_file_with_list
  p 'Enter path to file '
  path = gets.strip
  if File.exist? path
    data_from_file = File.read(path)
    begin
      Marshal.load(data_from_file)
    rescue => ex
      puts "#{ex.class}: #{ex.message}"
      search_file_with_list
    end
  else
    p 'File doesn`t exist'
    search_file_with_list
  end
end

empl_list = search_file_with_list


p 'Sorted list:'
sorted_list = empl_list.sort_by { |emp| [-emp.salary, emp.name] }.each { |emp| p emp.to_s }

p 'First five names:'
sorted_list.first(5).each { |emp| p emp.name }

p 'Last 3 id:'
sorted_list.last(3).each { |emp| p emp.id }

p 'Select file for writing:'
path = gets.strip
File.open(path, 'w') {|file| file.write Marshal.dump(empl_list)}


