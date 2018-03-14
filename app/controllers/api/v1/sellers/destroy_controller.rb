module Api::V1::Sellers
  class DestroyController < SellersController
    before_action :authenticate_user!
    before_action :set_seller

    def destroy
      if @seller.destroy
        render json: @seller, status: :destroyed
      else
        render json: ErrorSerializer.serialize(@seller.errors)
      end
    end

    private

    # Consultar el seller que será destruido
    def set_seller
      @seller = Seller.find(params[:id])
    end
    
  end
end
