module V1
  class AdventuresController < ApplicationController
    before_action :authenticate_user!
  end
end
