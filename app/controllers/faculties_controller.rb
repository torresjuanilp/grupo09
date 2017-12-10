class FacultiesController < ApplicationController
  def new
	if current_user.permits.find_by(name: "Administrar facultades") == nil
			flash[:danger] = "No tiene los permisos necesarios para crear una Facultad."
			redirect_to faculties_path
		else
			@faculty = Faculty.new
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
  end

  def update
  end

  def destroy
	if user_signed_in?
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
