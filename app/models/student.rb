class Student < ActiveRecord::Base
	has_many :appointments
	has_many :classrecords, through: :appointments
	def lastname
		return [name.split.shift].join(" ")
	end
	def firstname
		return name.split[0]
	end
end
