module Api::V1::Advertises
  class ShowController < AdvertisesController

    before_action :set_advertise, only: %i[show]

    def index
      @advertises = Advertise.all
      render json: @advertises, status: 200
    end

    def show
      render json: @advertise, status: 200
    end
  end
end
