require './fixed_employee'
require './hourly_employee'

class FileHelper

  def selecting_data_source
    choice = 0
    until choice == 1 || choice == 2
      p '1) Select file 2) Use existing data'
      choice = gets.to_i
      empl_list =
          case choice
            when 1
              search_file_with_list
            when 2
              [
                  FixedEmployee.new('Jane', 8000), HourlyEmployee.new('Ron', 45),
                  FixedEmployee.new('Stan', 8700), HourlyEmployee.new('Beverly', 70),
                  HourlyEmployee.new('Jim', 35), FixedEmployee.new('Iren', 6750),
                  FixedEmployee.new('Bill', 8700), HourlyEmployee.new('Susan', 60),
                  HourlyEmployee.new('John', 45), FixedEmployee.new('Kate', 7500)
              ]
          end
    end
    empl_list
  end

  def write_list_to_selected_file(empl_list)
    p 'Specify file for writing'
    path = gets.strip
    File.open(path, 'w') {|file| file.write Marshal.dump(empl_list)}
  end


  private

  def search_file_with_list
    p 'Enter path to file for reading data'
    path = gets.strip
    if File.exist? path
      data_from_file = File.read(path)
      begin
        Marshal.load(data_from_file)
      rescue => ex
        p 'File doesn`t contain data'
        search_file_with_list
      end
    else
      p 'File doesn`t exist'
      search_file_with_list
    end
  end

end
