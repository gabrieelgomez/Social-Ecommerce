module Api::V1::Independents
  # Show controller
  class ShowController < IndependentsController
    # Callbacks
    before_action :authenticate_v1_user!, only: [:own_independents]
    before_action :set_independent, only: [:show]


    # Public methods
    def index
      render json: Independent.all
    end

    def show
      render json: @independent
    end

    def own_independents
      # byebug
      render json: current_v1_user.independents
    end
  end
end
