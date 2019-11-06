module Api::V1::Users
  class GeneralController < UsersController
    before_action :authenticate_v1_user!, except: %i[validate_nickname]

    # GET /v1/users/rate_to_profiles
    def raiting
      @rates = Rate.where(user: current_v1_user)
      render json: @rates, status: 200
    end

    # GET /v1/users/filters_cotizations
    def filters_cotizations
      @cotizations = current_v1_user.cotizations
      @profile.cotizations.date_between(params[:initial], params[:last])
      render json: @cotizations, status: 200
    end

    def validate_nickname
      nickname = User.new(nickname: params[:nickname])
      nickname.valid?
      if nickname.errors.messages[:nickname][0] == 'has already been taken'
        render json: {errors: 'Has already been taken'}, status: 409
      else
        render json: {success: 'Nickname available'}, status: 200
      end
    end

    def update_nickname
      nickname = User.new(nickname: params[:nickname])
      nickname.valid?
      if nickname.errors.messages[:nickname][0] == 'has already been taken'
        render json: {errors: 'Has already been taken'}, status: 409
      elsif params[:nickname]
          current_v1_user.update(nickname: params[:nickname])
          render json: current_v1_user, status: 200
      else
        render json: {errors: 'Ooops, service unavailable'}, status: 200
      end
    end

  end
end
