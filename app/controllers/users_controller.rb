class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:spam_me]

  def index
    @users = User.includes(:profile).all
  end

  def spam_me
    TestMailer.boring(current_user).deliver_now
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def edit_profile
    @user = User.find(params[:user_id])
    @profile = @user.profile
    render :edit
  end

  def update_profile
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @profile.update(profile_params)
    redirect_to @user
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :homepage, :avatar)
  end
end
