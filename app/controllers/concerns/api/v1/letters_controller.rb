
class Api::V1::LettersController < ApplicationController

  def destroy
    letter = Letter.find(params[:letter_id])
    letter.destroy()
    game = Game.find(params["game_id"])

    GameChannel.broadcast_to(game, {
        type: "DELETE_LETTER",
        payload: {letter_id: params["letter_id"]}
      })

  end

  def show
    letter = Letter.find(params[:id])
    render json: letter
  end

  def check
    words = params[:words]
    object = {}
    words.each do |word|
      if !Dictionary.words.include?(word)
        object[word] = false
      end
    end
    render json: object
  end

  # private
  # def letter_params
  #   params.require(:letter).permit(:value, :id, :game_id)
  # end

end
