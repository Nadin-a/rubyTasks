require 'securerandom'

class Employee

  MESS = 'SYSTEM ERROR: method missing'.freeze

  attr_accessor :id, :name, :rate

  def initialize(name, rate)
    @id = SecureRandom.hex
    @name = name
    @rate = rate
  end

  def show
    p @id + ' ' + @name + ' ' + calculate_salary.to_s
  end


  def to_csv
    [self.class, @id, @name, @rate]
  end

  private

  def calculate_salary
    raise MESS;
  end

end

