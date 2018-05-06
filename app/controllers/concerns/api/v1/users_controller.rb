class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.find_or_create_by(name: user_params[:name])y
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
