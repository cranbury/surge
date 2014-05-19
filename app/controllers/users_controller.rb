class UsersController < ApplicationController
  before_action :authenticate!, only: [:show]

  def show
    @user = current_user
    @teams = Team.where user_id: @user.id
    render :show
  end

  def new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.permit(:email, :first_name, :password, :password_confirmation)
  end
end