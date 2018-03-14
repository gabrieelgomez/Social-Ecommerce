module Api::V1::Sellers
  class UpdateController < SellersController
    before_action :authenticate_user!

    def update
      if @seller.update(seller_params)
        render json: @seller, status: :created
      else
        render json: ErrorSerializer.serialize(@seller.errors)
      end
    end

    private

    # Consultar el seller que será editado
    def set_seller
      @seller = Seller.find(params[:id])
    end

  end
end
