class ResetPassword < ApplicationMailer
  default from: 'bigwave.ve@gmail.com'
  # layout 'push'

    def send_token(user)
      @user = user
      mail(
        from: 'bigwave.ve@gmail.com',
        to: @user.email,
        subject: 'Recuperación de contraseña'
      )
    end

end
