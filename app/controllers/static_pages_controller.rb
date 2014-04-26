class StaticPagesController < ApplicationController
  layout 'homepage', only: :home
  def home
    if customer_signed_in?
      redirect_to explore_path
    elsif vendor_signed_in?
      redirect_to vendor_profile_path
    end

  end

end
