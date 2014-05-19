class PlayersController < ApplicationController
  def create
    @player = Player.create(player_params) 
    render json: @player
  end

  private
  def player_params
    params.permit(:name, :email, :team_id)
  end
end