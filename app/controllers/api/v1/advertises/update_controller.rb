module Api::V1::Advertises
  class UpdateController < AdvertisesController
    before_action :authenticate_v1_user!, only: %i[update]
    before_action :verify_superadmin_rol, only: %i[update]
    before_action :set_advertise, only: %i[update add_click_user increase_seen]

    def update
      if @advertise.update(advertise_params)
        render json: @advertise, status: 200
      else
        render json: @advertise.errors, status: 500
      end
    end

    def add_click_user
      if @advertise.add_user_click(params[:user_id], params[:click_time])
        render json: @advertise, status: 200
      else
        render json: @advertise.errors, status: 500
      end
    end

    def increase_seen
      if @advertise.increase_seen_count
        render json: @advertise, status: 200
      else
        render json: @advertise.errors, status: 500
      end
    end
  end
end
