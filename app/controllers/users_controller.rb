class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def apitoken
    @user = User.find(params[:id])
    render json: @user.apitoken, status: :ok
  end
end
