class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, :only => [:create]
  private
  def current_user?(user)
  	@current_user == user
  end
  def sign_up_params
    params.require(:user).permit(:name, :apellido, :facultad, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :apellido, :facultad, :email, :password, :password_confirmation, :current_password)
  end



  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :apellido, :facultad, :email, :password) }
    end

  
end
