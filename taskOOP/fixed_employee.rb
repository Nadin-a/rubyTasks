require './employee'

class FixedEmployee < Employee

  attr_accessor :fixed_salary

  def initialize(name, fixed_salary)
    @fixed_salary = fixed_salary
    super(name)
    calculate_salary
  end

  def to_csv
    [self.class, @id, @name, @fixed_salary]
  end

  private

  def calculate_salary
    @salary = @fixed_salary
  end

end

