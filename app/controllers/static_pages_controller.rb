require 'yelp_interface'

class StaticPagesController < ApplicationController

  def home
    @tangerine = Yelp.new("tangerine", "80304")
    @data = @tangerine.get_vendor_data
  end

end
