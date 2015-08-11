class CoursesController < ApplicationController

	before_action :set_course, :only => [:show,:edit,:update,:destroy]

	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
		set_category

		if set_category.count == 0
			redirect_to categories_path, notice: "There must be registered at least one category. Sign a category! "
		end
	end

	def show
		set_category
	end

	def edit
		@category = Category.all
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			redirect_to courses_path, notice: "Course #{@course.name} successfully created!"
		else
			render "new"
		end
	end

	def update
		if @course.update(course_params)
			redirect_to courses_path, notice: "Course #{@course.name} has been updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@course.destroy

		redirect_to courses_path, notice: "Course #{@course.name} deleted successfully!"
	end


	private
	def set_category
		if @course.category_id? 
			@category = [@course.category]
		else
			@category = Category.all
		end
	end

	def set_course
		@course = Course.find(params[:id])		
	end

	def course_params
		params.require(:course).permit(:name, :workload, :value, :description, :category_id)
	end
end