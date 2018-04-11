module Api::V1::Concerns::PasswordValidation
  extend ActiveSupport::Concern

  private

  def validate_password
    psswd = params[:current_password]
    unless current_v1_user.valid_password?(params[:current_password])
      render json: { 
        error: [
          'Your password is missing or invalid'
        ] 
      }, status: :unauthorized
    end
  end
end