class TeamsController < ApplicationController
  before_action :authenticate!

  def new
    @user = params[:user_id]
  end

  def create
    @user = params[:user_id]
    @team = Team.create(team_params)
    redirect_to user_team_path(@user, @team)
  end

  def show
    @user = params[:user_id]
    @team = Team.find(params[:id])
  end

  private
  def team_params
    params.permit(:name, :description, :user_id)
  end 
end