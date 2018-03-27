module Api::V1::Independents
  # Show controller
  class ShowController < IndependentsController
    # Callbacks
    before_action :authenticate_user!, only: [:own_independents]
    before_action :set_independent, only: [:show]


    # Public methods
    def index
      render json: Independent.where(type_profile: 'independent')
    end

    def show
      render json: @independent
    end

    def own_independents
      render json: {
        status: 'success',
        data:   User.where(id: current_user.id).as_json(root: true, include: :independents)
      }
    end
  end
end
