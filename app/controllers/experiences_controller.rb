class ExperiencesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
end
