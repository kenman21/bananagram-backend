class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  # def create
  #   user = User.find_or_create_by(name: user_params[:name])
  #   render json: user
  # end

  def login

    user = User.find_by(name: user_params[:name])
    byebug
    if user && user.authenticate(user_params[:password].strip)
      render json: user
    else
      render json: {errors: "That username and password could not be found."}
    end
  end

  def register
    user = User.new(name: user_params[:name], password: user_params[:password].strip)
    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
