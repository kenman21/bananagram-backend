class Api::V1::GamesController < ApplicationController

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.create()
    game.create_letters()
    game.shuffled_letters=game.letters.shuffle
    render json: game
  end

  def letters
    game = Game.find(params[:game_id])
    byebug
    render json: game.letters
  end

  def join
    game = Game.find(params[:game_id])
    render json: game
  end

end
