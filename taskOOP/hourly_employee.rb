require './employee'

class HourlyEmployee < Employee

  HOUR = 'hourly'.freeze

  def to_csv
    [HOUR, @id, @name, calculate_salary]
  end

  def to_hash
    {pay_type: HOUR, id: @id, name: @name, rate: calculate_salary}
  end

  def calculate_salary
    20.8 * 8 * @rate
  end

end

