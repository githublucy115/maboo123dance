class Student < ActiveRecord::Base
	has_many :appointments
	has_many :classrecords, through: :appointments
end
