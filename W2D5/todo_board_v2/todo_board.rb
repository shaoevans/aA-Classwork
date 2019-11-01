require_relative "list"
require "byebug"

class TodoBoard
    
    def initialize
        @lists = Hash.new
    end



  
    def get_command
        print "\nEnter a command: "
        cmd, label, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @lists[label] = List.new(label)
        when 'mktodo' 
            @lists[label].add_item(*args)
        when 'ls'
            @lists.keys.each {|k| puts k}
        when 'showall'
            @lists.each_value {|v| v.print}
        when 'up'
            @lists[label].up(*args.map {|el| el.to_i})
        when 'down'
            @lists[label].down(*args.map {|el| el.to_i})
        when 'swap'
            @lists[label].swap(*args.map {|el| el.to_i})
        when 'sort'
            @lists[label].sort_by_date!
        when 'priority'
            @lists[label].print_priority
        when 'print'
            if args.empty?
                @lists[label].print
            else
                @lists[label].print_full_item(args[0].to_i)
            end
        when 'toggle'
            @lists[label].toggle_item(args[0].to_i)
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end
        true
    end

    def run
        while self.get_command
        end
    end

end

myBoard = TodoBoard.new
myBoard.run

# myList = List.new("toys")
# myList.add_item("fix toy", "2019-10-30", "need to fix toy")
# myList.add_item("fix light", "2019-10-29", "need to fix light")
# myList.add_item("fix toilet", "2019-01-09", "need to fix toilet")
# myList.add_item("fix computer", "2018-12-15", "need to fix computer")

# mktodo cheese 2019-10-25 foooooood
# mktodo toothpaste 2019-10-23
# mktodo candy 2019-10-31 sugar-free
# mktodo shampoo 2019-10-25
# print
# sort
# print
# swap 0 3
# print
# print 1
# priority
# down 0
# print
# up 3 2
# print