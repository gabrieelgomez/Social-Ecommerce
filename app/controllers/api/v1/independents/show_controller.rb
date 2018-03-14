module Api::V1::Independents
  # Show controller
  class ShowController < IndependentsController
    # Callbacks
    # before_action :authenticate_user!
    before_action :set_independent, only: :show


    # Public methods
    def index
      render json: Independent.where(type_profile: 'independent')
    end

    def show
      render json: @independent
    end

    # def own_pymes
    #   render json: Pyme.where(user_id: current_user.id, type_profile: 'pyme')
    # end
  end
end
