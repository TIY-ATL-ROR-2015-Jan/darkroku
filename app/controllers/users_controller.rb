class UsersController < ApplicationController
  def index
    @users = User.includes(:profile).all
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def edit_profile
  end

  def update_profile
  end
end
