require './employee'

class HourlyEmployee < Employee

  attr_accessor :rate

  def initialize(name, rate)
    @rate = rate
    super(name)
    calculate_salary
  end

  def to_csv
    [self.class, @id, @name, @rate]
  end

  private

  def calculate_salary
    @salary = 20.8 * 8 * @rate
  end

end

