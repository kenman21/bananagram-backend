class Api::V1::GamesController < ApplicationController

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.create()
    game.create_letters()
    render json: game
  end

  def join
    game = Game.find(params[:game_id])
    match = Match.create({game_id: params[:game_id], user_id: params[:user_id]})
    render json: prepare_game(game, true)
  end

  def peel
    game = Game.find(params[:game_id])
    GameChannel.broadcast_to(game, {
        type: "PEEL_LETTER",
        payload: {users_letters: game.peel}
      })
  end

  def winner
    game = Game.find(params[:game_id])
    user = params[:user]
    GameChannel.broadcast_to(game, {
        type: "WINNER",
        payload: {winner: user[:name]}
      })
  end

  private

  def prepare_game(game, with_letters = false)
		game_hash = {
			id: game.id
		}
		if with_letters
			game_hash[:letters] = game.letters.map {|letter| prepare_letter(letter)}
		end
		game_hash

	end

  def prepare_letter(letter)
		letter_hash = {
			id: letter.id,
			value: letter.value,
		}
	end


end
