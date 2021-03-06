module Api::V1::Users
  class OmniauthController < UsersController
    before_action :set_user, only: %i[create_or_find]

    def create_or_find
      if @user
        @user.update!(temporal_password: SecureRandom.hex(3))
        render json: {email: @user.email, temporal_password: @user.temporal_password, provider: params[:provider], change_password: @change_password}, status: 200

      else
        render json: {errors: 'Not found provider.'}, status: 200
      end
    end

    private

    def set_user
      @user = User.find_by(email: params[:email])
      @change_password = false
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
        @user.update(tokens: nil)
        @user.save! if @user.valid?
      else
        @user.update(tokens: nil)
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
