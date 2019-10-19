module Api::V1::Wishes
  class DestroyController < WishesController

    before_action :verify_and_set_wish

    def destroy
      if @wish&.destroy
        render json: @wish, status: 200
      else
        render json: @wish&.errors, status: 202
      end
    end

  end
end
