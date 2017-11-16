require 'securerandom'

class Employee

  MESS = 'SYSTEM ERROR: method missing'.freeze

  attr_accessor :id, :name, :rate

  def initialize(name, rate)
    @id = SecureRandom.hex
    @name = name
    @rate = rate
  end

  def to_s
    "#{self.id} #{self.name} #{calculate_salary}"
  end

  private

  def calculate_salary
    raise MESS;
  end

end

