require './employee'

class FixedEmployee < Employee

  MONTH = 'monthly'.freeze

  def calculate_salary
    @rate
  end

end

