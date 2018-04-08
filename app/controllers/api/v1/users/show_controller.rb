module Api::V1::Users
  class ShowController < UsersController
    before_action :authenticate_v1_user!, only: [:profile]
    # GET /v1/users
    def index
      render json: User.all
    end

    # GET /v1/users/{id}
    def show
      render json: User.find(params[:id])
    end

    def profile
      @current = current_v1_user
      render json: @current
    end
  end
end
