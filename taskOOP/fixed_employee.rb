require './employee'

class FixedEmployee < Employee

  attr_accessor :fixed_salary

  def initialize(name, fixed_salary)
    @name = name
    @fixed_salary = fixed_salary
    super(name)
    calculate_salary
  end

  def to_s
    "#{self.class} #{self.name} #{self.fixed_salary}"
  end

  def to_json
    { id: @id.to_s, name: @name, fixed_salary: @fixed_salary.to_s }
  end

  private

  def calculate_salary
    @salary = @fixed_salary
  end

end

