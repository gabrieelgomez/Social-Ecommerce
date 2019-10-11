module Api::V1::Users
  class OmniauthController < UsersController
    before_action :set_user, only: %i[create_or_find]

    def create_or_find
      if @user
        @user.update!(temporal_password: SecureRandom.hex(3))

        if @change_password
          render json: {email: @user.email, temporal_password: @user.temporal_password, provider: params[:provider], message: 'You have a provisional password, if you want to sign in normally, please change your password from the user profile.'}, status: 200
        else
          render json: {email: @user.email, temporal_password: @user.temporal_password, provider: params[:provider]}, status: 200
        end

      else
        render json: {errors: 'Not found provider.'}, status: 200
      end
    end

    private

    def set_user
      @user = User.find_by(email: params[:email])

      unless @user
        @user = User.new(
          name:              params[:firstName],
          lastname:          params[:lastName],
          nickname:          params[:name]&.parameterize + SecureRandom.hex(3) + 'cp7cr7' || SecureRandom.hex(6) + params[:email],
          email:             params[:email],
          omniauth_provider: params[:provider],
          omniauth_id:       params[:id],
          password:          SecureRandom.hex(6)
        )

        @change_password = true

        @user.save! if @user.valid?
      else
        @user.update(
          omniauth_provider: params[:provider],
          omniauth_id:       params[:id]
        )

        @change_password = true if @user.nickname.include?('cp7cr7')
      end

      @user
    end

  end
end
