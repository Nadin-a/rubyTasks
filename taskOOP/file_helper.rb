require 'csv'
require "yaml"
require 'json'
require './fixed_employee'
require './hourly_employee'

module FileHelper

  def read
    path = gets.strip
    if File.exist? path
      data = CSV.read(path)
      list = convert_to_emp_list(data)
    else
      p 'File doesn`t exist'
      read
    end
  end

  def write(path, list_for_writing)
    CSV.open(path, 'wb') do |csv_object|
      list_for_writing.each do |item|
        csv_object << [item]
      end
    end
  end

  private

  def convert_to_emp_list(data)
    list = []
    data.each do |line|
      item = line[0].split
      case item[0]
        when 'FixedEmployee'
          list << FixedEmployee.new(item[1], item[2].to_i)
        when 'HourlyEmployee'
          list << HourlyEmployee.new(item[1], item[2].to_i)
      end
    end
    list
  end

end


