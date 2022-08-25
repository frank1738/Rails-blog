class Api::V1::UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user, status: :ok
  end
end
