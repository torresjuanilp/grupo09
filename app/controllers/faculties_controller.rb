class FacultiesController < ApplicationController
  def new
	if Permit.find_by(name: "Administrar facultades").enabled?
		if current_user.permits.find_by(name: "Administrar facultades") == nil
			flash[:danger] = "No tiene los permisos necesarios para crear una Facultad."
			redirect_to faculties_path
		else
			@faculty = Faculty.new
		end
	else
		flash[:danger] = "No está permitida la creación de Facultades."
		redirect_to faculties_path
	end
  end

  def create
	if user_signed_in?
		@faculty = Faculty.new
		@faculty.name = params[:faculty][:name]
		if @faculty.save
			flash[:success] = "La Facultad se ha creado con exito."
			redirect_to faculties_path
		else 
			if Faculty.exists?(name: @faculty.name)
				flash[:danger] = "La Facultad especificada ya existe."
				redirect_to faculties_path
			else
				flash[:danger] = "Error al crear la Facultad."
				redirect_to faculties_path
			end
		end
	
	else
		flash[:danger] = "Sólo los usuarios registrados pueder realizar esta acción."
		redirect_to faculties_path
	end
  end

  

  def edit
	if Permit.find_by(name: "Administrar facultades").enabled?
		if current_user.permits.find_by(name: "Administrar facultades") == nil
			flash[:danger] = "No posee los permisos para editar una facultad."
			redirect_to faculties_path
		else
			@faculty = Faculty.find(params[:id])
		end
	else
		flash[:danger] = "No está permitida la edición de Facultades."
		redirect_to faculties_path
	end
	
  end

  def update
	@faculty = Faculty.find(params[:id])
if params[:faculty][:name] == "Otra"
	flash[:danger] = "Nombre no permitido."
	redirect_to faculties_path
else
	if Faculty.find_by(name: params[:faculty][:name]) == nil
		if @faculty.update_attribute(:name,params[:faculty][:name])
			flash[:success] = "La Facultad se ha guardado con exito."
			redirect_to faculties_path
		else
			flash[:danger] = "Error al editar la Facultad."
			redirect_to faculties_path
		end
	else
		if params[:faculty][:name] == @faculty.name 
			if @faculty.update_attribute(:name,params[:faculty][:name])
				flash[:success] = "La Facultad se ha guardado con exito."
				redirect_to faculties_path
			else
				flash[:danger] = "Error al editar la Facultad."
				redirect_to faculties_path
			end
		else
			flash[:danger] = "La Facultad especificada ya existe."
			redirect_to faculties_path
		end
	end
end

  end

  def destroy
	if user_signed_in?
	if Permit.find_by(name: "Administrar facultades").enabled?
		if current_user.permits.find_by(name: "Administrar facultades") == nil
			flash[:danger] = "No tiene los permisos necesarios para eliminar una Facultad."
			redirect_to faculties_path
		else
			@faculty = Faculty.find(params[:id])
			@faculty.users.all.each do |u|
				otra=Faculty.find_by(name: "Otra")
				u.faculty = [otra]
				u.save
			end
			if @faculty.destroy
				flash[:success] = "La Facultad ha sido eliminada con exito."
				redirect_to faculties_path
			else 
				flash[:danger] = "Error al eliminar la Facultad."
				redirect_to faculties_path
			end
		end
	else
			flash[:danger] = "No está permitida la eliminación de Facultades."
			redirect_to faculties_path
	end
	else
			flash[:danger] = "Sólo los usuarios registrados pueder realizar esta acción."
			redirect_to faculties_path
	end
  end

  def show
	@faculty = Faculty.find(params[:id])
  end

  def show_users
	@faculty = Faculty.find(params[:id])
  end

  def index
	@faculties = Faculty.all
  end
end
