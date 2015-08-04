class TeachersController < ApplicationController

	before_action :set_teacher, :only => [:show,:edit,:update,:destroy]

	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new
	end

	def show
	end

	def edit
	end

	def create
		@teacher = Teacher.new(teacher_params)
		if @teacher.save
			redirect_to teachers_path, notice: "Teacher #{@teacher.full_name} successfully created!"
		else
			render "new"
		end
	end

	def update
		if @teacher.update(teacher_params)
			redirect_to @teacher, notice: "Teacher has been updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@teacher.destroy

		redirect_to teachers_path, notice: "Teacher #{@teacher.full_name} deleted successfully!"
	end

	private

	def set_teacher
		@teacher = Teacher.find(params[:id])		
	end
	def teacher_params
		params.require(:teacher).permit(:full_name, :user_name, :email, :password, :password_confirmation)
	end
end
