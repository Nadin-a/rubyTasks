require './employee'

class HourlyEmployee < Employee

  def initialize(name, rate)
    @salary = rate
    super(name)
  end

  def calculate_salary
    20.8 * 8 * @salary
  end

end

