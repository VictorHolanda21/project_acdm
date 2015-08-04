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

	def update
		if @student.update(student_params)
			redirect_to students_path, notice: "Aluno #{@student.full_name} foi atualizado com sucesso!"
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
		@student.destroy

		redirect_to students_path, notice: "Aluno #{@student.full_name} foi deletado com sucesso!"
	end
	private

	def set_student
		@student = Student.find(params[:id])		
	end

	def student_params
		params.require(:student).permit(:full_name, :user_name, :email, :password, :password_confirmation)
	end
end