class LogInController < ApplicationController
  def home
    flash[:sign_in] = "Lets start saving today!"
  	@user = current_user
  	render 'home'
  end
  def pinPage
  	render "pin_page"
  end

  def pin_signin
  	user = User.find_by(login_pin: params[:login_pin])
  	redirect_to('/')
  end

  def show
    @users = current_user.memberships.where(id: :user_id)
  	@user = current_user
  	@groups = @user.groups
  	render 'user_profile'
  end


  private

  def second_login_params
    params.require(:users).permit(:login_pin)
  end
end
