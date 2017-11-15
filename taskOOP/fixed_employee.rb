require './employee'

class FixedEmployee < Employee

  attr_accessor :fixed_salary

  def initialize(id, name, fixed_salary)
    @fixed_salary = fixed_salary
    super(id, name)
    calculate_salary
  end

  def to_s
    "#{self.class}#{'|'}#{self.id}#{'|'}#{self.name}#{'|'}#{self.fixed_salary}"
  end

  private

  def calculate_salary
    @salary = @fixed_salary
  end

end

