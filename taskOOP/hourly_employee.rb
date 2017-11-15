require './employee'

class HourlyEmployee < Employee
  def calculate_salary
    20.8 * 8 * @rate
  end

end

