class PasswordsController < ApplicationController
  before_action :authenticate_user!
  def edit

  end

  def update
    if current_user.update(password_params)
      redirect_to edit_password_path, notice: "Your password has changed successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def password_params
    params.require(:user).permit(:password_challenge, :password, :password_confirmation).with_defaults(password_challenge: "")
  end
end