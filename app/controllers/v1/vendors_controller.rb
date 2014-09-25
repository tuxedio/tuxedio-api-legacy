module V1
  class VendorsController < ApplicationController
    before_action :authenticate_user!
  end
end
