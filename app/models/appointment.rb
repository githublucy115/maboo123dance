class Appointment < ActiveRecord::Base
	belongs_to :student
	belongs_to :classrecord
	def student_name
		return Student.find(student_id).name
	end
	def class_date
		return Classrecord.find(classrecord_id).date
	end
end
