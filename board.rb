require_relative "list"
require_relative "item"



class Board
    def initialize
        @lists={}
    end

    def get_command
        puts "Please enter a command : "
        command,list,*args=gets.chomp.split(" ")
        case command
        when 'ls'
            @lists.keys.each { |label| puts ' ' + label }
        when 'showall'
            @lists.each_value(&:print)

        when "mklist"
            @lists[list]=List.new(list)
        when 'mktodo'
            @lists[list].add_item(*args)
        when 'up'
            @lists[list].up(*args.map(&:to_i))
        when 'down'
            @lists[list].down(*args.map(&:to_i))
        when 'swap'
            @lists[list].swap(*args.map(&:to_i))
        when "rm"
            @lists[list].remove_item(*args[0].to_i)
        when "toggle"
            @lists[list].toggle_item(*args[0].to_i)
        when 'sort'
            @lists[list].sort_by_date!
        when 'priority'
            @lists[list].print_priority
        when 'print'
            if args.empty?
                @lists[list].print
            else
                @lists[list].print_full_item(args[0].to_i)
            end
        when "purge"
             @lists[list].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end 
        true
    end   
    
    def run 
        while true
            return if !get_command
        end 
    
    end


end
Board.new.run