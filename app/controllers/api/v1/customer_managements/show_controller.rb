module Api::V1::CustomerManagements
  class ShowController < CustomerManagementsController

    before_action :set_profile, only: %i[show]

    def show
      render json: @profile.customer_management,
            #  serializer: ShowSerializer,
             status: 200
    end

    private

    def set_profile
      @profile = custom_find do
        current_v1_user.profiles.find(params[:profile_id])
      end
    end
  end
end
