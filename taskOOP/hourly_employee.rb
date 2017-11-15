require './employee'

class HourlyEmployee < Employee

  attr_accessor :rate

  def initialize(id, name, rate)
    @rate = rate
    super(id,name)
    calculate_salary
  end

  def to_s
    "#{self.class}#{'|'}#{self.id}#{'|'}#{self.name}#{'|'}#{self.rate}"
  end

  private

  def calculate_salary
    @salary = 20.8 * 8 * @rate
  end

end

