class V1::VendorsController < ApplicationController
  before_action :authenticate_user!
end
