require './employee'

class FixedEmployee < Employee

  MONTH = 'monthly'.freeze

  def to_csv
    [MONTH, @id, @name, @rate]
  end

  def calculate_salary
    @rate
  end

end

