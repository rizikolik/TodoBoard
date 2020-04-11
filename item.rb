class Item
	attr_accessor :title , :deadline , :description
	def initialize(title, deadline, description)
		if Item.valid_date?(deadline)
			@title=title
			@deadline=deadline
			@description=description
			@done=false
		else
			puts "Enter a valid date:"
		end
	end


	def self.valid_date?(date)
	splitted=date.split("-").map(&:to_i)
		year,month,day=splitted
		return false if splitted.length!=3
		return false if !(0..12).include?(month)
		return false if !(0..31).include?(day)
		true
	end
end


