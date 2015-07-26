class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
		if @student.update(student_params)
			redirect_to @student
		else
			render 'edit'
		end
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path, notice: "Aluno #{@student.full_name} foi criado com sucesso!"
		else
			render 'new'
		end
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		redirect_to students_path, notice: "Aluno #{@student.full_name} foi deletado com sucesso!"
	end
	private

	def student_params
		params.require(:student).permit(:full_name, :user_name, :email, :password, :password_confirmation)
	end
end