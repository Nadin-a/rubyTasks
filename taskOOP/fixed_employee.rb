require './employee'

class FixedEmployee < Employee

  MONTH = 'monthly'.freeze

  def to_csv
    [MONTH, @id, @name, calculate_salary]
  end

  def to_hash
    {pay_type: MONTH, id: @id, name: @name, rate: calculate_salary}
  end

  def calculate_salary
    @rate
  end

end


