module V1
  class PeopleController < ApplicationController
    include Roar::Rails::ControllerAdditions

    #before_action :authenticate_user!, only: [:edit, :destroy, :update]
    before_action :set_v1_person, only: [:show, :edit, :update, :destroy]
    respond_to :json

    def index
      @v1_people = V1::Person.all

      respond_with @v1_people, represent_with: PeopleRepresenter
    end

    def show
      respond_with @v1_person, represent_with: PersonRepresenter
    end

    def new
      @v1_person = V1::Person.new
    end

    def create
      @v1_person = Person.new v1_person_params

      if @v1_person.save
        respond_with @v1_person, represent_with: PersonRepresenter
      else
        render json: @v1_person.errors, status: :unprocessable_entity
      end
    end

    def update
      consume!(@v1_person, represent_with: PersonRepresenter)
      @v1_person.save

      respond_with @v1_person, represent_with: PersonRepresenter
    end

    def destroy
      @v1_person.destroy

      head :no_content
    end

    private

    def set_v1_person
      @v1_person = V1::Person.find params[:id]
    end

    def v1_person_params
      params.require(:person).permit(
        :bio,
        :gender,
        :hometown,
        :location,
        :name,
        :date_of_birth,
        user_attributes: [:id, :email, :password]
      )
    end
  end
end
