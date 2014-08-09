class PeopleController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    @person = current_user.rolable
  end

end
