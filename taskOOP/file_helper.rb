require 'csv'
require 'json'

module FileHelper

  DATA_SEPARATOR = '|'
  JSON_FORMAT = 'json'
  CSV_FORMAT = 'csv'
  HEADERS = %w[pay_type ID name rate]

  def read
    path = gets.strip
    case path.split('.').last
    when JSON_FORMAT
      read_json(path)
    when CSV_FORMAT
      read_csv(path)
    else
      p "#{'Uncorrect format of file ' + path + 'for reading. Try .csv or .json'}"
      read
    end
  rescue Errno::ENOENT, ArgumentError => ex
    p ex
    read
  end

  def write(list_for_writing)
    path = gets.strip
    case path.split('.').last
    when JSON_FORMAT
      write_json(path, list_for_writing)
    when CSV_FORMAT
      write_csv(path, list_for_writing)
    else
      write_custom_file(path, list_for_writing)
    end
  rescue Errno::ENOENT, ArgumentError => ex
    p ex
    write(list_for_writing)
  end

  private

  def write_json(path, list_for_writing)
    File.open(path, 'w') do |file|
      file << JSON.dump(list_for_writing.map!(&:to_hash))
    end
    p "#{'File ' + path + ' was created'}"
  end

  def write_csv(path, list_for_writing)
    CSV.open(path, 'wb', write_headers: true, col_sep: DATA_SEPARATOR) do |csv_object|
      csv_object << HEADERS
      list_for_writing.each do |item|
        csv_object << item.to_csv
      end
    end
    p "#{'File ' + path + ' was created'}"
  end

  def write_custom_file(path, list_for_writing)
    File.open(path, 'w') do |file|
      list_for_writing.each do |item|
        file << item.to_s + "\n"
      end
    end
    p "#{'File ' + path + ' was created'}"
  end

  def read_json(path)
    JSON.parse(File.read(path))
  rescue JSON::ParserError => e
    p "#{'Uncorrect file ' + path}"
    read
  end

  def read_csv(path)
    data_from_csv = CSV.read(path, headers: true, col_sep: DATA_SEPARATOR)
    if data_from_csv.headers.first(4) == HEADERS
      data_from_csv
    else
      p "#{'Uncorrect headers in ' + path + '. Must be: pay_type, ID, name, rate'}"
      read
    end
  end

end

