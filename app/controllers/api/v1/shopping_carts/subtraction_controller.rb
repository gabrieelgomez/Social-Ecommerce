module Api::V1::ShoppingCarts
  class SubtractionController < ShoppingCartsController

    # Callbacks
    # before_action :set_product, only: %i[remove_product]
    before_action :set_shopping_cart, only: %i[remove_product multiple_remove]
    before_action :set_item, only: %i[remove_product]
    before_action :set_multiple_items, only: %i[multiple_remove]

    def remove_product
      if @item.destroy
        render json: @shopping_cart, status: 200
      else
        render json: @shopping_cart.errors, status: 500
      end
    end

    def multiple_remove
      Item.destroy @multiple_items
    rescue ActiveRecord::RecordNotFound => err
      render json: {
        error: err.message
      }
    else
      render json: @shopping_cart
    end

    private

    def set_item
      @item = custom_find {
        @shopping_cart.items.find(params[:item_id])
      }
      rescue_not_found if @item.nil?
    end

    def set_multiple_items
      @multiple_items = params[:items].split('-').map &:to_i
    end
  end
end
