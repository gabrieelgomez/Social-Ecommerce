module Api::V1::Wishes
  class DestroyController < WishesController

    # Callbacks
    before_action :verify_and_set_wish

    def destroy
      if @wish.destroy
        render json: @wish
      else
        render json: @wish.errors
      end
    end
  end
end