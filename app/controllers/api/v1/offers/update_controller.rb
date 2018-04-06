module Api::V1::Offers
  class UpdateController < OffersController
    before_action :authenticate_v1_user!
    # before_action :offer_params, only: [:create]
    # before_action :set_profile, only: [:create]
    # before_action :current_user_productable

    def update
    end
  end
end
