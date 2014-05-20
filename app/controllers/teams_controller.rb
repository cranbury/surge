class TeamsController < ApplicationController
  before_action :authenticate!
  before_action :find_team, except: [:new, :create]

  def new
    @user = params[:user_id]
  end

  def create
    Team.create(team_params)
    redirect_to "/"
  end

  def show
    @user = params[:user_id]
  end

  def edit
  end

  def update
    @team.update(name: params["team"]["name"], description: params["team"]["description"])
    redirect_to "/"
  end

  def auth_destroy
    user = User.find(params[:user_id])
    if user && ( current_user.authenticate(params[:team][:password]) )
      @team.destroy
      redirect_to "/"
    else
      # the email/password is wrong!
      flash.now[:notice] = "Wrong Password."
      redirect_to "/"
    end
  end

  def destroy
    @user = current_user
  end

  private
  def find_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.permit(:name, :description, :user_id)
  end 
end