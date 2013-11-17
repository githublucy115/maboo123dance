class Student < ActiveRecord::Base
	has_many :appointments
	has_many :classrecords, through: :appointments
	def lastname
		names = name.split
		names.shift
		last = names.join(" ")
		if last == ""
			last="NORECORD"
		end
		return last.gsub(/[^a-z]/i,'')
	end
	def firstname
		return name.split[0]
	end
	def in_debt?
		return balance < 0
	end
end
