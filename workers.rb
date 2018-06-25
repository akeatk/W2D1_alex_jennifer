require 'byebug'

class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end

  private
  attr_reader :name, :title, :boss
end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    get_salaries * multiplier
  end

  def get_salaries
    employees.reduce(0) do |sum, employee|
      if employee.is_a?(Manager)
        sum += employee.get_salaries
      end
      sum += employee.salary
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", "Founder", 1000000)
  darren = Manager.new("Darren", "TA Manager", 78000, ned)
  david = Employee.new("David", "TA", 10000, darren)
  shawna = Employee.new("Shawna", "TA", 12000, darren)

  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
end
