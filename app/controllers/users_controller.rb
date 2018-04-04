class UsersController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @user = current_user
  end

  private

  def user_params
  params.require(:user).permit(:email, :first_name, :last_name, :photo, :phone_number)
  end
end
