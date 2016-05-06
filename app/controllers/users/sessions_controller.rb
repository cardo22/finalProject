class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user #means you need to be logged in before you can see these pages
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def sign_up_params
    params.require(:users).permit(:first_name, :last_name, :card_number, :login_pin, :email, :password, :password_confirmation)
  end

  def login_params
    params.require(:users).permit(:email, :password)
  end

  def second_login_params
    params.require(:users).permit(:login_pin)
  end
end
