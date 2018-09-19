module Api::V1::Locations
  class ShowController < LocationsController
    # before_action :authenticate_v1_user!
    # before_action :set_locatable, only: %i[show]

    def index
      @locations = Location.all
      render json: @locations, status: 200
    end

    def show
      @locatable_type = params[:locatable_type].modelarize
      @locatable = @locatable_type.find(params[:locatable_id])
      @locations = @locatable.locations
      render json: @locations, status: 200
    end
  end
end
