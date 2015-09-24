class WelcomeController < ApplicationController
	def index
		@courses = Course.last(3).reverse
	end

	def about
	end

	def contact
	end
end