require './fixed_employee'
require './hourly_employee'

employee_list = [
    FixedEmployee.new('Jane', 8000), HourlyEmployee.new('John', 45),
    FixedEmployee.new('Stan', 8700), HourlyEmployee.new('Beverly', 70),
    FixedEmployee.new('Bill', 8700), HourlyEmployee.new('Susan', 60),
    HourlyEmployee.new('Ron', 45), FixedEmployee.new('Kate', 7500)
]

employee_list.each {|emp| emp.calculate_salary}


sorted_list = employee_list.sort_by {|emp| [-emp.salary, emp.name]}.each {|emp| p emp.to_s}

p ' '

sorted_list.first(5).each {|emp| p emp.name}

p ' '

sorted_list.last(3).each {|emp| p emp.id}

p 'Enter path to file '
path = 'file_with_data.txt' #gets.strip

data = File.open(path, 'w') {|file| file.write employee_list}

config = IO.read(path)
p config