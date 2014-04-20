require 'json'

class VendorsController < ApplicationController
  before_action :authenticate_vendor!
  include Yelp

  def show
    @activities = current_vendor.activities.paginate(page: params[:page], :per_page => 10)
  end

  def confirm_details

    if @data == false
      redirect_to root_path
    end

    @data ||= get_vendor_data
  end

  def update_details

    @data ||= get_vendor_data

    current_vendor.update!(
      name:         @data[:vendor_name],
      zip_code:     @data[:vendor_postal],
      address:      @data[:vendor_address],
      phone_number: @data[:vendor_phone],
      country:      @data[:vendor_country],
      coordinates:  @data[:vendor_coordinates],
      sample_image: @data[:vendor_image],
      state:        @data[:vendor_state],
      confirmed: true
    )

    redirect_to vendor_profile_path

  end
end
