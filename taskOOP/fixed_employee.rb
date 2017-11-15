require './employee'

class FixedEmployee < Employee

  def calculate_salary
    @rate
  end

end

