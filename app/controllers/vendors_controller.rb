class VendorsController < ApplicationController
  include Yelp
  before_action :authenticate_vendor!

  def show
    @activities = current_vendor.activities.paginate(page: params[:page], :per_page => 10)
  end

  def update
  end

  def confirm_details
    # Vendor info pulled from Yelp
    # Eventually make this a form
    @data ||= get_vendor_data
    @vendor = current_vendor

    if @data == false
      current_vendor.update(confirmed: true)
      redirect_to vendor_profile_path
    end

  end

  # If customer confirms details are correct,
  # this controller will update database with
  # information from Yelp.
  def update_details

    @data ||= get_vendor_data
    if params[:vendor_accepted] == "true"
      current_vendor.update_with_yelp_details(@data) 
      flash[:success] = "Success! Your information was updated."
    end

    current_vendor.update!(confirmed: true)
    redirect_to vendor_profile_path

  end
end
