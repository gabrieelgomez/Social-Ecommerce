module Api::V1::Users
  class GeneralController < UsersController
    before_action :authenticate_v1_user!

    # GET /v1/users/my_cotizations
    def my_cotizations
      @cotizations = current_v1_user.cotizations.to_json
      render json: @cotizations, status: 200
    end

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

  end
end
