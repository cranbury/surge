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

  end
end