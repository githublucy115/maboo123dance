class Transaction < ActiveRecord::Base
	def dollaramount
		return number_to_currency(amount)
	end
end
