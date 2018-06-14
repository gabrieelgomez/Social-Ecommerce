module Api::V1::Independents
  # Show controller
  class ShowController < IndependentsController
    # Callbacks
    before_action :authenticate_v1_user!, only: %i[own_independents]
    before_action :set_independent, only: %i[show]


    # Public methods
    def index
      render json: Independent.all, status: 200
    end

    def show
      render json: @independent, status: 200
    end

    def own_independents
      render json: current_v1_user.independents, status: 200
    end
  end
end
