module Api::V1::Products::Options
  class ShowController < OptionsController

    def index
      render json: own_options(params[:profile_id], params[:product_id]),
             status: 200
    end

  end
end
