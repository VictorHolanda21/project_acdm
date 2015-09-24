class Category < ActiveRecord::Base

	has_many :course

	validates_presence_of :name, :description
	validates_uniqueness_of :name, :description
	validates_length_of :description, maximum: 150

	def self.search(query)
		where('name LIKE ?', "%#{query}%")
	end
end
