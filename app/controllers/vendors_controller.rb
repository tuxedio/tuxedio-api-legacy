require 'json'
require 'yelp_interface'

class VendorsController < ApplicationController
  before_action :authenticate_vendor!

  def show
    @activities = current_vendor.activities.paginate(page: params[:page], :per_page => 10)
  end

  def confirm_details
    @details = Yelp.new(current_vendor.name, current_vendor.zip_code)

    if @details.get_vendor_data == false
      redirect_to root_path
    end

    @data = @details.get_vendor_data
  end
end
