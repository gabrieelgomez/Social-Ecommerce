module Api::V1
  class CustomerManagements::CustomerManagementsController < ApiController
    before_action :authenticate_v1_user!

    private

    def set_profile
      @profile = custom_find do
        current_v1_user.profiles.find(params[:profile_id])
      end
    end
  end
end
