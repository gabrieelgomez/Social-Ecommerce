module Api::V1::Wishes
  class DestroyController < WishesController

    # Callbacks
    # before_action :validate_password, only: %i[destroy]
    before_action :set_product

    def destroy
      if @wishes.destroy_all
        render json: {wish: 'Deleted'}, status: 200
      else
        render json: @wishes.errors, status: 500
      end
    end

    private

    def set_product
      @wishes = current_v1_user.wishes.where(wisheable_id: params[:product_id])
      return @wishes if @wishes
      render json: {
        error: [
          'Register could not be found'
        ]
      }, status: 404
    end

  end
end
