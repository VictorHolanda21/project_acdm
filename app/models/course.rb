class Course < ActiveRecord::Base

	belongs_to :category

	validates_presence_of :name, :workload, :value, :description, :category_id
	validates_uniqueness_of :name, :workload, :value, :description
	validates_length_of :description, maximum: 150
	
	validates_numericality_of :category_id, greater_than: 0
	validates_numericality_of :workload, greater_than: 0
	validates_numericality_of :value, greater_than_or_equal_to: 0
end
