class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :danger, :info, :warning, :success

  def configure_permitted_parameters
    devise_parameter_sanitizer.enum_for(:account_update) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end
end
