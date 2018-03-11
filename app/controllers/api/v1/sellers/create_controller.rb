module Api::V1::Sellers
  class CreateController < SellerController

    # GET /api/v1/sellers
    def new
      @seller = Seller.new
    end

    # GET /api/v1/sellers/{id}
    def create
      @seller = Seller.new(seller_params)

      if @seller.save
        render json: @seller
      else
        render :new
      end
    end

    private

    def product_params
      params.require(:seller).permit(...)
    end

  end
end
