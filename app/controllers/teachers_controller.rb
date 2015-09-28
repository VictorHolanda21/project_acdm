class TeachersController < ApplicationController
	before_filter :authenticate_user!
	
	before_action :set_teacher, :only => [:show,:edit,:update,:destroy]

	# before_filter :verify_authorize, :except => :index

	def index
    if params[:search]
      @teachers = Teacher.search(params[:search])
    else
      @teachers = Teacher.all
    end
    authorize @teachers
	end

	def new
		@teacher = Teacher.new
		@teacher.build_user
	end

	def show
		# authorize @teacher, :show?
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
		@teacher.user.destroy
		@teacher.destroy

		redirect_to teachers_path, notice: "Teacher #{@teacher.full_name} deleted successfully!"
	end

	private

	def set_teacher
		@teacher = Teacher.find(params[:id])		
	end

	def teacher_params
		params.require(:teacher).permit(:full_name, :user_name, :user_attributes => [:email, :password])
	end

  def verify_authorize
    authorize @teacher
  end
end
