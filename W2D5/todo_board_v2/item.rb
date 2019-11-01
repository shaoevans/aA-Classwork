class Item
    attr_reader :done
    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_string)
        date = date_string.split('-')
        return false if date[0].length != 4
        return false if date[1].to_i > 12
        return false if date[2].to_i > 31
        true
    end

    def initialize(title, deadline, description)
        if Item.valid_date?(deadline)
            @title = title
            @deadline = deadline 
            @description = description
            @done = false
        else
            raise "Invaild deadline"
        end
    end

    def toggle
        @done = !@done
    end

end


