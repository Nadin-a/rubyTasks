require './file_helper'

file_helper = FileHelper.new

empl_list = file_helper.selecting_data_source

p 'List:'
empl_list.each {|item| p item.to_s}

p 'Sorted list:'
sorted_list = empl_list.sort_by {|emp| [-emp.salary, emp.name]}.each {|emp| p emp.to_s}

p 'First five names:'
sorted_list.first(5).each {|emp| p emp.name}

p 'Last 3 id:'
sorted_list.last(3).each {|emp| p emp.id}

file_helper.selecting_file_for_writing(empl_list)

