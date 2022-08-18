class ApplicationController < ActionController::Base
  def current_user
    @current_u = User.first
  end
end
