class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  #REQUIRED TO USE DEVISE WITH CUSTOM FIELD INPUT
  before_action :configure_permitted_parameters, if: :devise_controller?

  #Helper Methods for user authentification
  helper_method :person_signed_in?, :vendor_signed_in?

  def vendor_signed_in?
    user_signed_in? and current_user.vendor?
  end

  def person_signed_in?
    user_signed_in? and current_user.person?
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) do |u|
    #   u.permit(:email,
    #            :password,
    #            :password_confirmation,
    #            :current_password
    #           )
    # end
  end
end
