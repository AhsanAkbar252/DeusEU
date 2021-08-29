class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:home,:myeu]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:mobile,:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:mobile,:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:mobile])
  end


  def after_sign_in_path_for(resource)
    return root_path if resource.active?

    otp = (SecureRandom.random_number(9e5) + 1e5).to_i
    session[:otp] = otp
    sms = "Confirmation code #{otp}"
    puts "OTPPPP ++++>>>      #{sms}"
    TwilioClient.new.send_text(resource.mobile, sms)
    flash[:notice] = ''
    confirm_phone_path
  end


  def authenticate_admin!
    authenticate_user!
    redirect_to root_path status: :forbidden unless current_user.admin?
  end
end
