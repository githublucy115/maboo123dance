class Expense < ActiveRecord::Base
  belongs_to :student
  has_many :payments
  def dollaramount
    return number_to_currency(amount)
  end
  def date
    return created_at.to_time.strftime("%m/%d/%Y")
  end
  def paid
  	paid = 0
  	payments.each do |payment|
  		paid += payment.amount
  	end
  	paid
  end
end
