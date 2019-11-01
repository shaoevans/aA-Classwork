class Dog
    def initialize(name, breed, age, bark, fav_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = fav_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(num)
        @age = num
    end

    def favorite_foods
        @favorite_foods
    end

    def bark
        if self.age > 3 
            @bark.upcase 
        else 
            @bark.downcase
        end
    end

    def favorite_food?(str)
        @favorite_foods.map { |food| food.downcase }.include?(str.downcase)
    end

end
