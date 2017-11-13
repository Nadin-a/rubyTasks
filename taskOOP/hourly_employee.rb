require './employee'

class HourlyEmployee < Employee

  attr_accessor :rate

  def initialize(name, rate)
    @name = name
    @rate = rate
    super(name)
    calculate_salary
  end

  private

  def calculate_salary
    @salary = 20.8 * 8 * @rate
  end

end
