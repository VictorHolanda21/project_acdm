class TeachersController < ApplicationController
	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new
	end

	def show
		@teacher = Teacher.find(params[:id])
	end

	def edit
		@teacher = Teacher.find(params[:id])
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
		@teacher = Teacher.find(params[:id])
		if @teacher.update(teacher_params)
			redirect_to @teacher, notice: "Teacher has been updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@teacher = Teacher.find(params[:id])
		@teacher.destroy

		redirect_to teachers_path, notice: "Teacher #{@teacher.full_name} deleted successfully!"
	end

	private

	def teacher_params
		params.require(:teacher).permit(:full_name, :user_name, :email, :password, :password_confirmation)
	end
end
