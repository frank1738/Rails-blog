class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_with_token
  before_action :authenticate_user!

  def current_post
    User.find(params[:user_id]).posts.find(params[:id] || params[:post_id])
  end

  protected

  # def current_user
  #   @current_u = User.first
  # end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end

  def authenticate_with_token
    return unless params[:apitoken]

    user = User.find_by_api_token(params[:apitoken])
    sign_in(user)
  end
end
