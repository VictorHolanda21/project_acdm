class CategorysController < ApplicationController
	def index
		@categorys = Category.all
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categorys_path, notice: "Category #{@category.full_name} successfully created!"
		else
			render "new"
		end
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			redirect_to @category, notice: "Category has been updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		redirect_to categorys_path, notice: "Category #{@category.full_name} deleted successfully!"
	end

	private

	def teacher_params
		params.require(:category).permit(:name, :description)
	end
end