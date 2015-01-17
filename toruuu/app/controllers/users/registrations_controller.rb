class Users::RegistrationsController < Devise::RegistrationsController
 before_action :configure_permitted_parameters, only: [:update]

  private 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name,:phonetic,:age,:email, :password, :password_confirmation, :current_password)
    end
  end  


  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
 
end