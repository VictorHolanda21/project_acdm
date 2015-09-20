class CoursesController < ApplicationController
	before_filter :authenticate_user!, :only => [:index, :new, :edit, :update, :destroy, :create]

	before_action :set_course, :only => [:show,:edit,:update,:destroy]

	def index
		@courses = Course.all
	end

	def new
		if Category.count == 0
			redirect_to categories_path, notice: "There must be registered at least one category. Sign a category! "
		else
			@course = Course.new
		end
	end

	def show
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
	def set_course
		@course = Course.find(params[:id])		
	end

	def course_params
		params.require(:course).permit(:name, :workload, :value, :description, :category_id, :course_img)
	end
end