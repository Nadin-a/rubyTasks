require './fixed_employee'
require './hourly_employee'
require './file_helper'

choice = 0

include FileHelper

until choice == 1 || choice == 2
  p '1) Select file 2) Use existing data'
  choice = gets.to_i
end

empl_list =
    case choice
      when 1
        p 'Enter path to file for reading data'
        FileHelper.read
      when 2
        [
            FixedEmployee.new('Jane', 8000), HourlyEmployee.new('Ron', 45),
            FixedEmployee.new('Stan', 8700), HourlyEmployee.new('Beverly', 70),
            HourlyEmployee.new('Jim', 35), FixedEmployee.new('Iren', 6750),
            FixedEmployee.new('Bill', 8700), HourlyEmployee.new('Susan', 60),
            HourlyEmployee.new('John', 45), FixedEmployee.new('Kate', 7500)
        ]
    end


p 'List:'
empl_list.each(&:show)

p 'Sorted list:'
sorted_list = empl_list.sort_by { |emp| [-emp.salary, emp.name] }.each(&:show)

p 'First five names:'
sorted_list.first(5).each { |emp| p emp.name}

p 'Last 3 id:'
sorted_list.last(3).each { |emp| p emp.id }

p 'Specify file for writing'
path = gets.strip
FileHelper.write(path, empl_list)

