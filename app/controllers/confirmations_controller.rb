class ConfirmationsController < ApplicationController

    def create
      @user = User.find_by(email: params[:user][:email].downcase)
  
      if @user.present? && @user.unconfirmed?
        @user.send_confirmation_email!
        ...
      end
    end
  
end
  