class LogInController < ApplicationController
	before_action :authenticate_user! 
  def home
  	render 'home'
  end
  # def dashboard
  # end
end
