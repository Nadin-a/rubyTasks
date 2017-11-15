require 'csv'
require 'json'
require './fixed_employee'
require './hourly_employee'

module FileHelper

  def read
    path = gets.strip
    if File.exist? path + '.csv'
      data = CSV.read(path + '.csv')
    else
      p 'File doesn`t exist'
      read
    end
  end

  def write(path, list_for_writing)
    CSV.open(path + '.csv', 'wb') do |csv_object|
      list_for_writing.each do |item|
        csv_object << [item.to_hash]
      end
    end
  end

end


