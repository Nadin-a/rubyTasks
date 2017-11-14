require './employee'

class HourlyEmployee < Employee

  attr_accessor :rate

  def initialize(name, rate)
    @name = name
    @rate = rate
    super(name)
    calculate_salary
  end

  def to_s
    "#{self.class} #{self.name} #{self.rate}"
  end

  def to_json
    { id: @id.to_s, name: @name, rate:  @rate.to_s }
  end

  private

  def calculate_salary
    @salary = 20.8 * 8 * @rate
  end

end

