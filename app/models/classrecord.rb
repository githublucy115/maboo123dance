class Classrecord < ActiveRecord::Base
	has_many :appointments
	has_many :students, through: :appointments
	validates :location, :cost, presence: true

	def date
		created_at.to_time.strftime("%m/%d/%Y")
	end	
end
