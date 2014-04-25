class StaticPagesController < ApplicationController

  def home
    if customer_signed_in?
      redirect_to explore_path
    end
  end

end
