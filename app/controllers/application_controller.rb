class ApplicationController < ActionController::Base
  #nameをデータとして保存する許可を与えるコード
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #サインイン後にどこに遷移するかを設定しているメソッド
    post_images_path #一覧画面へ
  end

  def after_sign_out_path_for(resource) #サインアウト後にどこに遷移するかを設定しているメソッド
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
