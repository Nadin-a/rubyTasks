require './employee'

class HourlyEmployee < Employee

  HOUR = 'hourly'.freeze

  def to_csv
    [HOUR, @id, @name, @rate]
  end

  def calculate_salary
    20.8 * 8 * @rate
  end

end

