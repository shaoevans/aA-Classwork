class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        if @flight_numbers.include?(str.upcase)
            return true
        else
            false
        end
    end

    def add_flight(str)
        flight = str.upcase
        if !has_flight?(flight)
            @flight_numbers << flight
        end
    end
end