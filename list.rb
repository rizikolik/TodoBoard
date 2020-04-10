require_relative "item"

class List
    attr_accessor :label
   def initialize(label)
    @label=label
    @items=[]
   end

   def add_item(title, deadline,*description)
    if Item.valid_date?(deadline)
   created=Item.new(title,deadline,description)
    @items << created
     return true
   else   
    return false
   end


   end
   def size
    @items.length
   end

   def valid_index?(idx)
 if @items[idx]!=nil
    return true
 else
    return false
 end
   end

   def swap(index_1, index_2)

        if valid_index?(index_1)&& valid_index?(index_2)
            @items[index_1],@items[index_2] =@items[index_2],@items[index_1]
            return true
        end
        false
    end
    def [](index)
    return nil if ! valid_index?(index)
    @items[index]
    end

    def priority
        return nil if @items.empty?
        @items.first
    end

    def print
      puts "---------------------------------------"
      puts "           #{@label}                   "
      puts "---------------------------------------"
      puts "Index | Item                 | Deadline"
      @items.each.with_index{|k,i| puts "#{i}     |#{k.title}               | #{k.deadline}"}
      puts "---------------------------------------"

    end

    def print_full_item(idx)
      if valid_index?(idx)
      puts"------------------------------------------"
      puts "#{@list[idx]}                         #{@list[idx]}"
     puts" #{@list[idx]}"
puts"------------------------------------------"
        
      end
    end

      def print_priority
        print_full_item(priority)
    end

    def up(index, amount=1)
      return false if !valid_index?(index)
      while amount > 0 && index != 0
        swap(index, index - 1)
        index -= 1
        amount -= 1
    end
    true
     end

     def down(index, amount=1)
      return false if !valid_index?(index)
      while amount > 0 && index != size - 1
        swap(index, index - 1)
        index += 1
        amount -= 1
    end

    true
     end

     def sort_by_date!
      @items.sort_by! { |item| item.deadline }
     end
   



end
