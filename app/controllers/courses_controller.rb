class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def show
		@course = Course.find(params[:id])
	end

	def edit
		@course = Course.find(params[:id])
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
		@course = Course.find(params[:id])
		if @course.update(course_params)
			redirect_to @courses, notice: "Course has been updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy

		redirect_to courses_path, notice: "Course #{@course.name} deleted successfully!"
	end

	private

	def course_params
		params.require(:course).permit(:name, :workload, :value, :description)
	end
end