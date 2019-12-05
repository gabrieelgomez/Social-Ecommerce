module Api::V1::Products::PriceRanges
  class ActionController < PriceRangesController
    before_action :authenticate_v1_user!
    before_action :current_user_productable
    before_action :set_product_range
    before_action :set_price_range, only: %i[update destroy]

    def create
      @price_range = PriceRange.new(price_ranges_params)
      @price_range.product = @product
      if @price_range.save
        render json: @price_range, status: 200
      else
        render json: @price_range.errors,
               status: 500
      end
    end

    def update
      if @price_range.update(price_ranges_params)
        render json: @price_range, status: 200
      else
        render json: @price_range.errors,
               status: 500
      end
    end

    def destroy
      if @price_range.destroy
        render json: @price_range, status: 200
      else
        render json: @price_range.errors,
               status: 500
      end
    end

    private

    def set_price_range
      @price_range = custom_find {
        @product.price_ranges.find(params[:price_range_id])
      }
    end
  end
end
