module Api::V1
  class Sellers::SellersController < ApiController

    def all_sellers
      render json: Seller.all
    end

  end
end
