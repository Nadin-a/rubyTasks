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
    if data.is_a? CSV::Table
      data.each do |item|
        case item[0]
          when FixedEmployee::MONTH
            employee_list << FixedEmployee.new(item[2], item[3].to_i)
          when HourlyEmployee::HOUR
            employee_list << HourlyEmployee.new(item[2], item[3].to_i)
        end
      end
    else
      p 'JSON'
      p JSON.load(data)
    end
  when 2
    employee_list = [
        FixedEmployee.new('Jane J. Osborn', 8000),
        HourlyEmployee.new('David E. Caudill', 45),
        FixedEmployee.new('Max N. Torres', 8700),
        HourlyEmployee.new('Clara G. Manley', 70),
        HourlyEmployee.new('Kenny S. Nelson', 35),
        FixedEmployee.new('Kristin G. Sachs', 6750),
        FixedEmployee.new('Donald R. Koontz', 8700),
        HourlyEmployee.new('Marion T. Green', 60),
        HourlyEmployee.new('John Weinberg', 45),
        FixedEmployee.new('Anita J. Isaacs', 7500)
    ]
end

if employee_list.empty?
  p 'List is empty'
  system.exit!
end

p 'List:'
employee_list.each(&:show)

p 'Sorted list:'
sorted_list = employee_list.sort_by {|emp| [-emp.calculate_salary, emp.name]}.each(&:show)

p 'First five names:'
sorted_list.first(5).each {|emp| p emp.name}

p 'Last 3 id:'
sorted_list.last(3).each {|emp| p emp.id}

p 'Specify file for writing'
FileHelper.write(employee_list)

