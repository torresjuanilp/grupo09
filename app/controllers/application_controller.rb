class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :assign_permits

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :apellido, :faculty_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :apellido, :faculty_id])
  end

def assign_permits
	if user_signed_in?
		@user = User.find(current_user.id)
		per = Permit.find_by(score: 1)
		@user.permits = [per]
		@user.save
		Permit.all.each do |p|
			if @user.puntaje >= p.score
				if @user.permits.find_by(name: p.name) == nil
					@user.permits << Permit.find_by(name: p.name)
				end
			end
		end
		
	end
end

end
