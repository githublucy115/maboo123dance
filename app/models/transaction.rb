class Transaction < ActiveRecord::Base
	def dollaramount
		return number_to_currency(amount)
	end
	def type
		return "expense" if amount < 0
		return "payment"
	end
	def date
		return created_at.to_time.strftime("%m/%d/%Y")
	end
end
