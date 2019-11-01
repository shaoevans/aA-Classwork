require_relative "list"
require "byebug"

class TodoBoard
    
    def initialize(label)
        @list = List.new(label)
    end

  
    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo' 
            @list.add_item(*args)
        when 'up'
            @list.up(*args.map {|el| el.to_i})
        when 'down'
            @list.down(*args.map {|el| el.to_i})
        when 'swap'
            @list.swap(*args.map {|el| el.to_i})
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_priority
        when 'print'
            if args.empty?
                @list.print
            else
                @list.print_full_item(args[0].to_i)
            end
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

myBoard = TodoBoard.new("My_Board")
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