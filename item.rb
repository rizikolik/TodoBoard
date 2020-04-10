class Item
	
	def self.valid_date?(date)
	splitted=date.split("-").map(&:to_i)
		year,month,day=splitted
		return false if splitted.length!=3
		return false if !(0..12).include?(month)
		return false if !(0..31).include?(day)
		true
	end
end

