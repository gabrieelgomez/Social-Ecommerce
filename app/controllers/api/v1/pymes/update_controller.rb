module Api::V1::Pymes
  # Update controller
  class UpdateController < PymesController
    before_action :authenticate_v1_user!
    before_action :set_my_pyme, only: %i[update]

    def update
      # title_will_change if @
      if @pyme.update(general_params(:pyme))
        @pyme.update(slug: params[:pyme][:slug].parameterize) if params[:pyme][:slug]
        @pyme.schedule.update(params[:schedule]) if params[:schedule]
        render json: @pyme, own: true, status: 200
      else
        render json: @pyme.errors, status: 422
      end
    end
  end
end
