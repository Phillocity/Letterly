class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :navbar_component
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name address description age avatar gender])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name address description age avatar gender])
  end

  def navbar_component
    if user_signed_in?
      @avatar = current_user.avatar
      @name = current_user.name.titleize
    else
      @avatar = "avatar-placeholder.png"
      @name = ""
    end
  end
end
