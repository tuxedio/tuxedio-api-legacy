class VendorsController < ApplicationController
  include Yelp
  before_action :authenticate_user!

  def show
    @experiences = current_user.rolable.experiences.paginate(page: params[:page], :per_page => 10)
  end

  def confirm_details

    # Vendor info pulled from Yelp
    @data   = get_vendor_data
    @vendor = current_user.rolable
    @vendor.update!(confirmed: true)

    if @data == false
      redirect_to vendor_profile_path
    end

  end

  # Update info with information from Yelp.
  def update_details
    if current_user.rolable.update(params[:vendor])
      flash['success'] = "Success! Your information was updated."
      redirect_to vendor_profile_path
    else
      flash['warning'] = "Something went wrong, your data could not be imported"
      redirect_to vendor_profile_path
    end
  end

private

  def yelp_params
    params.require(:yelp).permit(:name, :address, :location, :state, :zip, :country, :phone)
  end

end
