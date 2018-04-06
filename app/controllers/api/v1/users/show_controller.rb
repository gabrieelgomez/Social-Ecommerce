module Api::V1::Users
  class ShowController < UsersController
    before_action :authenticate_v1_user!, only: [:get_current_user]
    # GET /v1/users
    def index
      render json: User.all
    end

    # GET /v1/users/{id}
    def show
      render json: User.find(params[:id])
    end

    def get_current_user
      @current = current_v1_user
      render json: @current
    end

  end
end
