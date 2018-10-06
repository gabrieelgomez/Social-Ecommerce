module Api::V1::CustomerManagements
  class ShowController < CustomerManagementsController

    before_action :set_profile, only: %i[show]

    def show
      render json: @profile.customer_management,
             include: params[:include],
             fields:  fields(:customer_management),
             status:  200
    end
  end
end
