class Api::V1::LettersController < ApplicationController

  def destroy
    letter = Letter.find(params[:id])
    letter.destroy()
    render json: letter
  end

  def show
    letter = Letter.find(params[:id])
    render json: letter
  end

  # private
  # def letter_params
  #   params.require(:letter).permit(:value, :id, :game_id)
  # end

end
