require './employee'

class FixedEmployee < Employee

  attr_accessor :fixed_salary

  def initialize(name, fixed_salary)
    @name = name
    @fixed_salary = fixed_salary
    super(name)
  end

  def calculate_salary
    super
    @salary = @fixed_salary
  end

end