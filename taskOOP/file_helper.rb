require 'csv'

module FileHelper

  SEPARATOR = '|'

  def read
    path = gets.strip
    begin
      CSV.read("#{path}.csv", headers: true, col_sep: SEPARATOR)
    rescue Errno::ENOENT => ex
      p ex
      read
    end
  end

  def write(list_for_writing)
    path = gets.strip
    begin
      CSV.open(path + '.csv', 'wb', col_sep: SEPARATOR, write_headers: true) do |csv_object|
        csv_object << %w[class ID name rate]
        list_for_writing.each do |item|
          csv_object << item.to_csv
        end
      end
    rescue Errno::ENOENT => ex
      p ex
      write(list_for_writing)
    end
  end

end


