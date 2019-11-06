module Api::V1::Users
  class PasswordResetController < UsersController
    before_action :set_user, only: [:reset]
    before_action :authenticate_v1_user!, only: [:regenerate]

    def reset
      return user_not_found if @user.nil?

      expiration = ((Time.now) - @user.request_change_password)/60 > 5

      if expiration
        @user.update(custom_token: nil)
        render json: { errors: 'Token expiró, solicite uno nuevo' }, status: 200

      elsif params[:password] != params[:password_confirmation]
        render json: { errors: 'Las contraseñas no coinciden, solicite' }, status: 200

      else
        @user.tokens = nil
        @user.update_columns(custom_token: nil, request_change_password: Time.now)
        @user.update(password: params[:password])
        render json: { message: '¡Contraseña cambiada satisfactoriamente!' }, status: 200
      end
    end

    def regenerate
      if (params[:password] == params[:password_confirmation]) && (current_v1_user.nickname.include?('cp7cr7'))
        current_v1_user.update(nickname: current_v1_user.nickname.split('cp7cr7').join('')) if current_v1_user.nickname.include?('cp7cr7')
        current_v1_user.update(password: params[:password])
        render json: { message: '¡Contraseña cambiada satisfactoriamente!' }, status: 200
      else
        render json: { message: 'Hubo un error al actualizar la contraseña, verifique sus datos o sesión.' }, status: 403
      end
    end

    private
    def set_user
      @user = custom_find {
        User.find_by_custom_token(params[:token])
      }
    end

    def user_not_found
      render json: { errors: 'User not found' }, status: 200
    end

  end
end
