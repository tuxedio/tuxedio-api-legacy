module V1
  class ExperienceTimesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  end
end
