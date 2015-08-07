class Course < ActiveRecord::Base

	has_many :students

	validates_presence_of :name, :workload, :value, :description
	validates_uniqueness_of :name, :workload, :value, :description
	validates_length_of :description, maximum: 150
	
end
