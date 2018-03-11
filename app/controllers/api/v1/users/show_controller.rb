module Api::V1::Users
  class ShowController < UserController

    # GET /api/v1/users
    def index
      render json: User.all
    end

    # GET /api/v1/users/{id}
    def show
      render json: User.find(params[:id])
    end

  end
end
