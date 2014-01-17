class Classrecord < ActiveRecord::Base
	has_and_belongs_to_many :students
	validates :cost, presence: true

	def date
		pst = created_at.to_time.utc + Time.zone_offset("PST")
		pst.strftime("%m/%d/%Y")
	end

	def expenses
		e = Expense.where(:classrecord_id=>id)
		e = e.select{|p|p.payments.size>0 and not
			p.payments.last.payment_method == "dancecredit" and not
			p.payments.last.payment_method == "guest"
		}
	end

	def payments
		expenses.map{|e|e.payments}
	end

	def total_expense
		expenses.map{|expense|expense.amount}.sum
	end

	def total_revenue
		payments.sum.map{|e|e.amount}.sum rescue 0
	end
end
