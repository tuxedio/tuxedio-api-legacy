module V1
  class PeopleController < ApplicationController
    before_action :authenticate_user!

    private

    def people_params
      params.require(:person).permit(
        :name,
        :location,
        :bio,
        :picture,
        :current_adventure
      )
    end
  end
end
