class PlayersController < ApplicationController
  def create
    @player = Player.create(player_params) 
    render json: @player
  end

  def index
    @players = Player.where(team_id: params[:team_id])
    render json: @players
  end

  def destroy
    @player = Player.find(params[:id])

    if @player.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private
  def player_params
    params.permit(:name, :email, :team_id)
  end
end