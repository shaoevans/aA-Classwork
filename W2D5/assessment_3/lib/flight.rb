require "passenger.rb"

class Flight
    attr_reader :passengers
    def initialize(flight, capacity)
        @flight_number = flight
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity 
            return true
        else
            false
        end
    end

    def board_passenger(person)
        if person.has_flight?(@flight_number) && !self.full?
            @passengers << person
        end
    end

    def list_passengers
        list = []
        @passengers.each do |ele|
            list << ele.name
        end
        list
    end

    def [](num)
        @passengers[num]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end