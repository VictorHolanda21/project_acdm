class Administrator < ActiveRecord::Base

	has_one :user
	accepts_nested_attributes_for :user

	validates_presence_of :full_name, :user_name
	validates_uniqueness_of :user_name

	def self.search(query)
		where('user_name LIKE ?', "%#{query}%")
	end

end
