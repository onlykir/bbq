class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :danger, :info, :warning, :success

  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.enum_for(:account_update) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
    (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym : nil
  end
end
