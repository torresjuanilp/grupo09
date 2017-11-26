class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end
	
	def show
		@category = Category.find(params[:id])
		@questions = Category.find(params[:id]).questions.all
	end
	
	def show_pregunta
		@question = Question.find(params[:id])
	end
	
	def new
		@category = Category.new
	end
	
	def create
	if user_signed_in?
		@category = Category.new
		@category.name = params[:category][:name]
		if @category.save
			flash[:success] = "La categoría se ha creado con exito."
			redirect_to categories_path
		else 
			if Category.exists?(name: @category.name)
				flash[:danger] = "La categoría especificada ya existe."
				redirect_to categories_path
			else
				flash[:danger] = "Error al crear la categoría."
				redirect_to categories_path
			end
		end
	else
		flash[:danger] = "Sólo los usuarios registrados pueder realizar esta acción."
		redirect_to categories_path
	end
		
	end
	
	def destroy
		
	if user_signed_in?
		@category = Category.find(params[:id])
		@category.questions.all.each do |q|
			if q.categories.size <= 1
				gen=Category.find_by(name: "General")
				q.categories = [gen]
				q.save
			end
		end
		if @category.destroy
			flash[:success] = "La categoría ha sido eliminada con exito."
			redirect_to categories_path
		else 
			flash[:danger] = "Error al eliminar la categoría."
			redirect_to categories_path
		end
	else
		flash[:danger] = "Sólo los usuarios registrados pueder realizar esta acción."
		redirect_to categories_path
	end
	end
end
