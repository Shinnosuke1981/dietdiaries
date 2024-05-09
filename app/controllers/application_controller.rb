class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :biological_sex_id, :birth_date, :age, :start_date, :height, :starting_weight, :appropriate_weight, :BMI, :starting_BFP, :term_goal, :comment, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :biological_sex_id, :birth_date, :age, :start_date, :height, :starting_weight, :appropriate_weight, :BMI, :starting_BFP, :term_goal, :comment, :email, :password])
  end
end