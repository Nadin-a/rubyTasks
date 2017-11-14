class Employee

  @@count = 0
  MESS = "SYSTEM ERROR: method missing"

  attr_accessor :id, :name, :salary

  def initialize(name)
    @id = @@count += 1
    @name = name
  end

  def show
    p @id.to_s + ' ' + @name + ' ' + @salary.to_s
  end

  private

  def calculate_salary
    raise MESS;
  end

end

