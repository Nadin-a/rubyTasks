require './employee'

class FixedEmployee < Employee

  attr_accessor :fixed_salary

  def initialize(name, fixed_salary)
    @name = name
    @fixed_salary = fixed_salary
    super(name)
    calculate_salary
  end

  private

  def calculate_salary
    @salary = @fixed_salary
  end

end