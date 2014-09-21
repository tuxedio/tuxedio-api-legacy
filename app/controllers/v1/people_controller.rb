class V1::PeopleController < ApplicationController
  before_action :authenticate_user!
end
