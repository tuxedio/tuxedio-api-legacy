class V1::AdventuresController < ApplicationController
  before_action :authenticate_user!
end
