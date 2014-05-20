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

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    binding.pry
    @team.update(name: params["team"]["name"], description: params["team"]["description"])
    binding.pry
    redirect_to "/"
  end

  private
  def team_params
    params.permit(:name, :description, :user_id)
  end 
end