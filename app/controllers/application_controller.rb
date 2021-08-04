class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
   
    def configure_permitted_parameters
        attributes = [:first_name, :last_name, :role_id]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    end

    def after_sign_in_path_for(user)
        user_path(current_user)
    end
end
