module Api::V1::Wishes
  class UpdateController < WishesController

    # Callbacks
    before_action :verify_and_set_wish

    def update
      if @wish.update(wish_params)
        render json: @wish
      else
        render json: @wish.errors
      end
    end
  end
end