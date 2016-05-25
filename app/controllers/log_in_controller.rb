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
    group = current_user.groups.first
    @users = group.users
  	@user = current_user
  	@groups = @user.groups

    goals = group.goals

    @total_savings = 0

    goals.each do |goal|
      @total_savings += goal.current_amount
    end
  	render 'user_profile'
  end


  private

  def second_login_params
    params.require(:users).permit(:login_pin)
  end
end
