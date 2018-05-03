class API::V1::GamesController < ApplicationController

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.create()
  end

end
