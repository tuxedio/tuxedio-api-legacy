module V1
  class ExperiencesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

    def index
      @v1_experiences = V1::Experience.all

      render json: @v1_experiences
    end

    def show
      @v1_experience = V1::Experience.find params[:id]

      render json: @v1_experience
    end

    def new
      @v1_experience = V1::Experience.new
    end

    def edit
    end

    def create
      @v1_experience = V1::Experience.new(v1_experience_params)

      if @v1_experience.save
        render json: @v1_experience, status: :created
      else
        render json: @v1_experience.errors, status: :unprocessable_entity
      end
    end

    def update
      if @v1_experience.update(v1_experience_params)
        head :no_content
      else
        render json: @v1_experience.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @v1_experience.destroy

      head :no_content
    end

    private

    def set_v1_experience
      @v1_experience = V1::Experience.find(params[:id])
    end

    def v1_experience_params
      params[:v1_experience]
      #params.require(:experience).permit(:name, :location, :description, :vendor, :price)
    end
  end
end
