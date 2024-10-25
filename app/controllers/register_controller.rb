class RegisterController < ApplicationController
  allow_unauthenticated_access

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to roasts_path, notice: "Registration successful."
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:email_address, :password)
  end
end
