require 'securerandom'

class Employee

  MESS = 'SYSTEM ERROR: method missing'.freeze

  attr_accessor :id, :name, :salary

  def initialize(name)
    @id = SecureRandom.hex
    @name = name
  end

  def show
    p @id + ' ' + @name + ' ' + @salary.to_s
  end

  private

  def calculate_salary
    raise MESS;
  end

end

