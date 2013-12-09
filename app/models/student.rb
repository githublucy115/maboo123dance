class Student < ActiveRecord::Base
	before_save :default_values
	has_and_belongs_to_many :classrecords
	has_many :expenses
	validates :name, :email, :signature, presence: true
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
	def default_values
		self.balance ||= 0.0
		self.credit ||= 0
		self.signature ||= "/nosignature"
	end
end
