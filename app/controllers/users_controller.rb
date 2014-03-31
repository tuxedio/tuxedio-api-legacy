class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if params[:vendor] == true
      @user[:customer] = false
    else
      @user[:customer] = true
    end
    @user[:blogger] = false
    if @user.save
      flash[:success] = "Welcome to Tuxedo"
      redirect_to @user
    else
      flash[:error] = "Something Went Wrong"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :email, :password, :password_confirmation, :vendor)
  end

end
