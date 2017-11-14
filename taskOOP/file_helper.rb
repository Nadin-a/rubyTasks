require 'csv'
require 'json'
require './fixed_employee'
require './hourly_employee'

module FileHelper

  def read
    path = gets.strip
    if File.exist? path + '.csv'
      my_json = CSV.read(path + '.json')
      my_json.each do |item|
        p item
        #p JSON::parce(item[0]).class
      end
      data = CSV.read(path + '.csv')
    else
      p 'File doesn`t exist'
      read
    end
  end

  def write(path, list_for_writing)

    #Json.generate hash

    CSV.open(path + '.csv', 'wb') do |csv_object|
      list_for_writing.each do |item|
        csv_object << [item]
      end
    end

    CSV.open(path + '.json', 'wb') do |csv_object|
      list_for_writing.each do |item|
        p JSON.generate(item.to_json)
        csv_object << [JSON.generate(item.to_json)]
      end
    end
  end

end


