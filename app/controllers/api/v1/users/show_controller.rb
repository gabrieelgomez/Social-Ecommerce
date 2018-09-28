module Api::V1::Users
  class ShowController < UsersController
    before_action :authenticate_v1_user!, only: [:profile]
    # GET /v1/users
    def index
      @users = User.all
      render json: @users, status: 200
    end

    # GET /v1/users/{id}
    def show
      @user = custom_find { User.find(params[:id]) }
      render json: @user
    end

    def countries
      @countries = CS.countries
      result = @countries.map { |key, value| { code: key, name: value } }
      render json: { countries: result }, status: 200
    end

    def profile
      @current = current_v1_user
      render json: @current
    end
  end
end
