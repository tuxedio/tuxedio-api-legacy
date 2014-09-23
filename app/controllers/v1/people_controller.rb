module V1
  class PeopleController < ApplicationController
    before_action :authenticate_user!
  end
end
