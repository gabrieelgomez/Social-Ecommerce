module Api::V1::Independents
  # Update controller
  class UpdateController < IndependentsController
    before_action :authenticate_v1_user!
    before_action :set_my_independent, only: %i[update]

    def update
      if @independent.update(general_params(:independent))
        @independent.update(slug: params[:independent][:slug].parameterize) if params[:independent][:slug]
        @independent.schedule.update(params[:schedule]) if params[:schedule]
        render json: @independent, status: 200
      else
        render json: @independent.errors,
               status: 500
      end
    end
  end
end
