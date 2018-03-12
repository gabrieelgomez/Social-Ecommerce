class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # def resource_params
  #   params.permit(devise_parameter_sanitizer.for(:sign_in))
  # end
end
