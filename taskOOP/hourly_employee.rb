require './employee'

class HourlyEmployee < Employee

  attr_accessor :rate

  def initialize(name, rate)
    @name = name
    @rate = rate
    super(name)
  end

  def calculate_salary
    super
    @salary = 20.8 * 8 * @rate
  end

end