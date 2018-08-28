module Api::V1::Pymes
  # Show controller
  class ShowController < PymesController
    # Callbacks
    before_action :authenticate_v1_user!, only: :own_pymes
    before_action :set_pyme, only: %i[show]


    # Public methods
    def index
      render json: Pyme.all, status: 200
    end

    def show
      render json: @pyme,
             serializer: ::Pymes::ShowSerializer,
             scope: {fields: params[:fields]},
             status: 200
    end

    def own_pymes
      render json: current_v1_user.pymes, status: 200
    end
  end
end
