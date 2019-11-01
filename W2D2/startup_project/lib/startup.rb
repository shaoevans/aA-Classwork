require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(str)
        @salaries.has_key?(str)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        self.valid_title?(title) ? @employees << Employee.new(employee_name, title) : (raise StandardError.new)
    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise StandardError.new
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        average = []
        @employees.each { |employee| average << @salaries[employee.title] }
        average.sum / average.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.has_key?(title) }
        startup.employees.each { |ele| @employees << ele }
        startup.close
    end
    
end
