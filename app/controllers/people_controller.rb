class PeopleController < ApplicationController
  before_action :authenticate_person!

  def show
  end

  def edit
    @person = current_person
  end

end
