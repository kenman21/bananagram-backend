class Api::V1::GamesController < ApplicationController

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.create()
  end

  def join
    game = Game.find(params[:game_id])
    render json: game
  end

end
