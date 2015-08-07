class Category < ActiveRecord::Base

	validates_presence_of :name, :description
	validates_uniqueness_of :name, :description
	validates_length_of :description, maximum: 150

end
