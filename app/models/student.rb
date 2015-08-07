class Student < ActiveRecord::Base

	belongs_to :course
	delegate :name, to: :course, :prefix => "course"
	delegate :description, to: :course, :prefix => "course"

	validates_presence_of :full_name, :user_name, :email, :password
	validates_uniqueness_of :user_name, :email 
	validates_confirmation_of :password
	validates_length_of :password, minimum: 6
	
end
