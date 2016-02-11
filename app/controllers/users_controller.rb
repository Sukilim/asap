class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

protected
	 def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :email << :password << :username
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :email << :password << :username
  end

private

  def user_params
    params.require(:user).permit(:username)
  end
end