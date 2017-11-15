require './employee'

class FixedEmployee < Employee

  def initialize(name, fixed_salary)
    @salary = fixed_salary
    super(name)
  end

  def calculate_salary
    @salary
  end

end

