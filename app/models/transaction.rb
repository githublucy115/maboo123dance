class Transaction < ActiveRecord::Base
	def dollaramount
		return number_to_currency(amount)
	end
	def type
		return "expense" if payment_method == "unpaid"
		return "payment"
	end
	def date
		return created_at.to_time.strftime("%m/%d/%Y")
	end
end
