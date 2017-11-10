class Employee

  @@count = 0

  attr_accessor :id, :name, :salary

  def initialize(name)
    @id = @@count += 1
    @name = name
  end

  def to_s
    "#{self.id} #{self.name} #{self.salary}"
  end

  protected

  def calculate_salary

  end

end