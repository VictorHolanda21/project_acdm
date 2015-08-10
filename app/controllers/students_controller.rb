class StudentsController < ApplicationController

	before_action :set_student, :only => [:show,:edit,:update,:destroy]

	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def show
	end

	def edit
	end


	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path, notice: "Student #{@student.full_name} successfully created!"
		else
			render 'new'
		end
	end

	def update
		if @student.update(student_params)
			redirect_to students_path, notice: "Student #{@student.full_name} has been updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@student.destroy

		redirect_to students_path, notice: "Student #{@student.full_name} deleted successfully!"
	end
	private

	def set_student
		@student = Student.find(params[:id])		
	end

	def student_params
		params.require(:student).permit(:full_name, :user_name, :email, :password, :password_confirmation)
	end
end