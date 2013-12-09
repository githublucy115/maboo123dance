class Classrecord < ActiveRecord::Base
	has_and_belongs_to_many :students
	validates :cost, presence: true

	def date
		created_at.to_time.strftime("%m/%d/%Y")
	end	
end
