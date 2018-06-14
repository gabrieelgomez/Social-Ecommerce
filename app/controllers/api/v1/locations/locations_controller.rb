module Api::V1
  class Locations::LocationsController < ApiController
    private

    def set_locatable
      @locatable_type = params[:locatable_type].modelarize
      @locatable = @locatable_type.find_by(user: current_v1_user,
                                           id: params[:locatable_id])
    end
  end
end
