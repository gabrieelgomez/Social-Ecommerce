class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # include ProductSearch
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  #   added_attrs = [:name]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :name, :password, :password_confirmation])
  end

  def cors_set_access_control_headers
    p "CORS SET ACCESS CONTROL HEADER"
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      p "CORS PREFLIGHT CHECK"
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, Content-Type'
      headers['Access-Control-Max-Age'] = '1728000'

      render text: '', content_type: 'text/plain'
    end
  end

  def handle_options_request
    render :text => '', :content_type => 'text/plain'
  end
end