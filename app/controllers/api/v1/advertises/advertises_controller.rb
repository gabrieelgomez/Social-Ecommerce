module Api::V1
  class Advertises::AdvertisesController < ApiController

    private

    def advertise_params
      params.require(:advertise).permit(
        :cover, :status, :creator_id, :budget,
        images: [], advertisable_type: []
      )
    end

    def set_advertise
      @advertise = custom_find do
        Advertise.find(params[:advertise_id])
      end
    end
  end
end
