require 'csv'
require 'json'

module FileHelper

  SEPARATOR = '|'

  def read
    path = gets.strip
    #begin
    if path.end_with?('.json')
      File.read(path)
    elsif path.end_with?('.csv')
      CSV.read(path, headers: true, col_sep: SEPARATOR)
    else
      p 'Uncorrect format of file'
      read
    end
    # rescue Errno::ENOENT => ex
    #   p ex
    #   read
    # end
  end

  def write(list_for_writing)
    path = gets.strip
    # begin
    if path.end_with?('.json')
      write_json(path, list_for_writing)
    elsif path.end_with?('.csv')
      write_csv(path, list_for_writing)
    else
      p 'Uncorrect format of file'
      write(list_for_writing)
    end
    # rescue Errno::ENOENT => ex
    #   p ex
    #   write(list_for_writing)
    # end
  end

  private

  def write_json(path, list_for_writing)
    File.open(path, 'w') do |file|
      list_for_writing.each do |item|
        file << JSON.dump(item.to_hash)
        #file << "\n"
      end
    end
  end

  def write_csv(path, list_for_writing)
    CSV.open(path, 'wb', col_sep: SEPARATOR, write_headers: true) do |csv_object|
      csv_object << %w[pay_type ID name rate]
      list_for_writing.each do |item|
        csv_object << item.to_csv
      end
    end
  end

end
