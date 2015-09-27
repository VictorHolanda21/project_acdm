class Administrator < ActiveRecord::Base

	has_one :user
	accepts_nested_attributes_for :user

end
