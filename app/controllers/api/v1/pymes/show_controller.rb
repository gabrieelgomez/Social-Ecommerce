module Api::V1::Pymes
  # Show controller
  class ShowController < PymesController
    # Callbacks
    before_action :authenticate_user!, only: :own_pymes
    before_action :set_pyme, only: [:show]


    # Public methods
    def index
      render json: Pyme.where(type_profile: 'pyme')
    end

    def show
      render json: @pyme
    end

    def own_pymes
      render json: {
        status: 'success',
        data:   User.where(id: current_user.id).as_json(root: true, include: :pymes)
      }
    end
  end
end
