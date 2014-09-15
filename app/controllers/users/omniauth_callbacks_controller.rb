class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    resource = User.from_omniauth(request.env["omniauth.auth"])
    User.new_with_session(params, session)

    if resource.persisted?
      sign_in_and_redirect resource, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
