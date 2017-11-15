require 'csv'

module FileHelper

  def read
    path = gets.strip
    begin
      data = CSV.read("#{path}" + "#{'.csv'}", {:col_sep => '|'})
    rescue Errno::ENOENT => ex
      p ex
      read
    end
  end

  def write(list_for_writing)
    path = gets.strip
    begin
    CSV.open(path + '.csv', 'wb', col_sep: '|') do |csv_object|
      list_for_writing.each do |item|
        csv_object << item.to_s.parse_csv
      end
    end
    rescue Errno::ENOENT => ex
      p ex
      write(list_for_writing)
    end
  end

end


