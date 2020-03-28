module Api::V1::Advertises
  class CreateController < AdvertisesController
    # before_action :authenticate_v1_user!, only: %i[create]
    # before_action :verify_superadmin_rol, only: %i[create]

    def create
      @advertise = Advertise.new(advertise_params)
      if @advertise.save
        render json: @advertise, status: 200
      else
        render json: @advertise.errors, status: 422
      end
    end
  end
end
