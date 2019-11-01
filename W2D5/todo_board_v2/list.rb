require_relative "Item"
require "byebug"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index >= 0 && index < @items.length
            true
        else
            false
        end

    end
    
    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def print
        puts "----------------------------------------------------------------"
        puts @label.upcase.rjust(20)
        puts "----------------------------------------------------------------"
        puts "Index".ljust(7) + "|".ljust(4) + "Item".ljust(20) + "|".ljust(4) + "Deadline".ljust(15) + "|".ljust(4) + "Completed?".ljust(5)
        puts "----------------------------------------------------------------"
        @items.each_with_index do |item, i|
            puts "#{i}".ljust(7) + "|".ljust(4) + "#{item.title}".ljust(20) + "|".ljust(4) + "#{item.deadline}".ljust(15) + "|".ljust(4) + "#{item.done}"
            puts "----------------------------------------------------------------"
        end
    end

    def print_full_item(index)
        if !valid_index?(index)
            return nil
        else
            item = self[index]
            puts "----------------------------------------------"
            puts "#{item.title}".ljust(25) +  "#{item.deadline}"
            puts "#{item.description}".ljust(25) + "#{item.done}"
            puts "----------------------------------------------"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)
        while amount > 0 && index > 0
            swap(index, index-1)
            index -= 1
            amount -= 1
        end
        true
    end


    def down(index, amount=1)
        return false if !self.valid_index?(index)
        while amount > 0 && index < self.size-1
            swap(index, index+1)
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        if self.valid_index?(index)
            @items[index].toggle
        end
    end

    def remove_item(index)
        if self.valid_index?(index)
            @items.delete_at(index)
            true
        else
            false
        end
    end

    def purge
        @items.reject! { |item| item.done}
    end

end



# myList = List.new("toys")
# p myList.add_item("fix toy", "2019-10-30", "need to fix toy")
# p myList.add_item("fix light", "2019-10-29", "need to fix light")
# p myList.add_item("fix toilet", "2019-01-09", "need to fix toilet")
# p myList.add_item("fix computer", "2018-12-15", "need to fix computer")
# p myList[0]
# p myList[1]
# myList.swap(0,1)
# p myList[0]
# p myList[1]
# myList.toggle_item(1)
# myList.print
# myList.purge
# myList.print



# myList.print_full_item(0)
# myList.print_full_item(1)

