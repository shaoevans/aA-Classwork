require "byebug"

class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    self.employee_sals * multiplier
  end

  def employee_sals
    return salary if self.employees.empty?
    employees.sum do |employee|
      if employee.is_a?(Manager) 
        employee.salary + employee.employee_sals
      else 
        employee.salary
      end
    end
  end
  def add_employee(employee)
    @employees << employee
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p darren.is_a?(Employee)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000