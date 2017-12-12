class PermitsController < ApplicationController



  def create
  end

  def show
  end

  def disable
	@permit = Permit.find(params[:id])
	@permit.enabled = false
	if @permit.save
		flash[:success] = "El permiso ha sido deshabilitado."
		redirect_to permits_index_path
	else
		flash[:danger] = "Se produjo un error al deshabilitar el permiso."
		redirect_to permits_index_path
	end
  end

  def enable
	@permit = Permit.find(params[:id])
	@permit.enabled = true
	if @permit.save
		flash[:success] = "El permiso ha sido habilitado."
		redirect_to permits_index_path
	else
		flash[:danger] = "Se produjo un error al habilitar el permiso."
		redirect_to permits_index_path
	end
  end

def update
  @permit = Permit.find(params[:id])
  # if @permit.update_attributes(params[:permit])
  #   redirect_to :action => :show, :id => @permit.id
  # else
  #   render 'edit'
  # end
  permitted_columns = params.require(:permit).permit(:name, :description, :score)
  @permit.update_attributes(permitted_columns)
end
  def index
  end

def edit
  @permit = Permit.find(params[:id])
end
private 
	def permit_params
    	params.require(:permit).permit(:name, :descripcion, :score)
  end

end
