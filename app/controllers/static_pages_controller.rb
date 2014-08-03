class StaticPagesController < ApplicationController
  layout 'homepage', only: :home

  def home
    if user_signed_in?
      if current_user.person?
        redirect_to explore_path
      elsif current_user.vendor?
        redirect_to vendor_profile_path
      end
    end
  end

end
