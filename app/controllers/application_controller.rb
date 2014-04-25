class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #REQUIRED TO USE DEVISE WITH CUSTOM FIELD INPUT
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    #SPECIFY PARAMS FOR DEVISE TO USE
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:name, :location, :email, :password,
                 :password_confirmation, :current_password, :zip_code, :vendor, :picture)
      end
    end

    #REDIRECT DEVISE AFTER SIGN IN
    def after_sign_in_path_for(resource)
      if resource.class.name == "Customer"
        return root_path
      elsif resource.class.name == "Vendor"
        if current_vendor.confirmed == false
          return confirm_details_vendors_path
        else
          return root_path
        end
      else
        return root_path
      end
    end
end
