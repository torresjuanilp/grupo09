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
  if user_signed_in? && current_user.permits.find_by(name: "Modificar contenidos") != nil 
	  permitted_columns = params.require(:permit).permit(:name, :description, :score)
	  if @permit.update_attributes(permitted_columns)
	  	flash[:success] = "El permiso ha sido editado."
	  	redirect_to "/permits/index"
	  else
	  		flash[:danger] = "El permiso no se ha podido editar."
	  		redirect_to "/permits/index"
	  end
else 
	flash[:danger] = "No cuenta con los permisos suficientes para realizar esta accion."
		redirect_to "/permits/index"
end
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
