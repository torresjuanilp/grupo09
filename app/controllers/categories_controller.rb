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

  def edit
	if Permit.find_by(name: "Administrar categorias").enabled?
		if user_signed_in?
		if current_user.permits.find_by(name: "Administrar categorias") == nil
			flash[:danger] = "No posee los permisos para editar una categoría."
			redirect_to categories_path
		else
			@category = Category.find(params[:id])
		end
	else
		if user_signed_in?
		flash[:danger] = "No está permitida la edición de Categorías."
	else 
		flash[:danger] = "Debes iniciar sesión para modificar categoría"
		redirect_to categories_path
	end
	end
	end
  end
	
	def new
		if Permit.find_by(name: "Administrar categorias").enabled?
		if current_user.permits.find_by(name: "Administrar categorias") == nil
			flash[:danger] = "No tiene los permisos necesarios para crear una categoría."
			redirect_to categories_path
		else
			@category = Category.new
		end
		else
			flash[:danger] = "No está permitida la creación de categorías."
			redirect_to categories_path
		end
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

  def update
	@category = Category.find(params[:id])
if params[:category][:name] == ""
	flash[:danger] = "Nombre no permitido."
	redirect_to categories_path
else
	if Category.find_by(name: params[:category][:name]) == nil
		if @category.update_attribute(:name,params[:category][:name])
			flash[:success] = "La Categoría se ha guardado con exito."
			redirect_to categories_path
		else
			flash[:danger] = "Error al editar la Categoría."
			redirect_to categories_path
		end
	else
		if params[:category][:name] == @category.name 
			if @category.update_attribute(:name,params[:category][:name])
				flash[:success] = "La Categoría se ha guardado con exito."
				redirect_to categories_path
			else
				flash[:danger] = "Error al editar la Categoría."
				redirect_to categories_path
			end
		else
			flash[:danger] = "La Categoría especificada ya existe."
			redirect_to categories_path
		end
	end
end
end

	def destroy
		
	if user_signed_in?
	if Permit.find_by(name: "Administrar categorias").enabled?		
		if current_user.permits.find_by(name: "Administrar categorias") == nil
			flash[:danger] = "No tiene los permisos necesarios para eliminar una categoría."
			redirect_to categories_path
		else
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
		end
	else
		flash[:danger] = "No está permitida la eliminación de categorías."
		redirect_to categories_path
	end
	else
		flash[:danger] = "Sólo los usuarios registrados pueder realizar esta acción."
		redirect_to categories_path
	end
	end
end

