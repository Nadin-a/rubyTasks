require './employee'

class HourlyEmployee < Employee

  HOUR = 'hourly'.freeze

  def calculate_salary
    20.8 * 8 * @rate
  end

end

