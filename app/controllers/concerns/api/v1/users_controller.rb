class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    byebug
    user = User.find_or_create_by(name: user_params[:name])

  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
