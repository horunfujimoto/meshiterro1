class ApplicationController < ActionController::Base
  #nameをデータとして保存する許可を与えるコード
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
