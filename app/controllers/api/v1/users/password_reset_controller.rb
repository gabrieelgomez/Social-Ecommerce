module Api::V1::Users
  class PasswordResetController < UsersController
    before_action :set_user, only: [:reset]

    def reset
      return user_not_found if @user.nil?

      expiration = ((Time.now) - @user.request_change_password)/60 > 5

      if expiration
        @user.update(token: nil)
        render json: { errors: 'Token expiró, solicite uno nuevo' }, status: 500

      elsif params[:password] != params[:password_confirmation]
        render json: { errors: 'Las contraseñas no coinciden, solicite' }, status: 500

      else
        @user.update(token: nil, request_change_password: Time.now, password: params[:password])
        render json: { message: '¡Contraseña cambiada satisfactoriamente!' }, status: 200
      end
    end

    private
    def set_user
      @user = custom_find {
        User.find_by_custom_token(params[:token])
      }
    end

    def user_not_found
      render json: { errors: 'User not found' }, status: 500
    end

  end
end
