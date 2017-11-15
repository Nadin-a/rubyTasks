require './fixed_employee'
require './hourly_employee'
require './file_helper'


choice = 0

include FileHelper

until choice == 1 || choice == 2
  p '1) Select file 2) Use existing data'
  choice = gets.to_i
end

employee_list= []

case choice
  when 1
    p 'Enter path to file for reading data'
    data = FileHelper.read
    data.each do |item|
      case item[0]
        when 'FixedEmployee'
          employee_list << FixedEmployee.new(item[2], item[3].to_i)
        when 'HourlyEmployee'
          employee_list << HourlyEmployee.new(item[2], item[3].to_i)
      end
    end
  when 2
    employee_list = [
        FixedEmployee.new('Jane J. Osborn', 8000),
        HourlyEmployee.new( 'David E. Caudill', 45),
        FixedEmployee.new( 'Max N. Torres', 8700),
        HourlyEmployee.new( 'Clara G. Manley', 70),
        HourlyEmployee.new('Kenny S. Nelson', 35),
        FixedEmployee.new('Kristin G. Sachs', 6750),
        FixedEmployee.new( 'Donald R. Koontz', 8700),
        HourlyEmployee.new('Marion T. Green', 60),
        HourlyEmployee.new('John Weinberg', 45),
        FixedEmployee.new('Anita J. Isaacs', 7500)
    ]
end

p 'List:'
employee_list.each(&:show)

p 'Sorted list:'
sorted_list = employee_list.sort_by { |emp| [-emp.salary, emp.name] }.each(&:show)

p 'First five names:'
sorted_list.first(5).each { |emp| p emp.name }

p 'Last 3 id:'
sorted_list.last(3).each { |emp| p emp.id }

p 'Specify file for writing'
FileHelper.write(employee_list)

