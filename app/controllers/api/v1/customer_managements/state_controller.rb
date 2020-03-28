module Api::V1::CustomerManagements
  class StateController < CustomerManagementsController

    before_action :set_profile, only: %i[toggle_state]

    def toggle_state
      @crm = @profile.customer_management
      if @crm.toggle_active_state
        render json: @crm, status: 200
      else
        render json: @crm, status: 422
      end
    end
  end
end
