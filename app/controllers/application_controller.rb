class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_admin, :current_vendor, :current_customer, :require_admin!, :require_vendor!, :require_customer!

  def account_url
    return new_user_session_url unless user_signed_in?
    case current_user.class.name
    when "Admin"
      root_url
    when "Customer"
      root_url
    when "seller"
      root_url
    else
      root_url
    end if user_signed_in?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || account_url
  end

  def current_admin
    @current_admin ||= current_user if user_signed_in? and current_user.user_role == "Admin"
  end

  def current_customer
    @current_customer ||= current_user if user_signed_in? and current_user.user_role == "customer"
  end

  def current_vendor
    @vendor_vendor ||= current_user if user_signed_in? and current_user.user_role == "vendor"
  end

  def customer_logged_in?
    @customer_logged_in ||= user_signed_in? and current_customer
  end

  def admin_logged_in?
    @admin_logged_in ||= user_signed_in? and current_admin
  end

  def vendor_logged_in?
    @vendor_logged_in ||= user_signed_in? and current_vendor
  end

  def require_admin
    require_user_type(:admin)
  end

  def require_customer
    require_user_type(:customer)
  end

  def require_vendor
    require_user_type(:vendor)
  end

  def require_user_type(user_type)
    if (user_type == :admin and !admin_logged_in?) or
        (user_type == :vendor and !vendor_logged_in?) or
        (user_type == :customer and !customer_logged_in?)
        redirect_to root_path, status: 301, notice: "You must be logged in a#{'n' if user_type == :admin} #{user_type} to access this content"
      return false
    end
  end

end
