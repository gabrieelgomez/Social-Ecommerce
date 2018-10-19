module Api::V1
  class ShoppingCarts::ShoppingCartsController < ApiController
    before_action :authenticate_v1_user!

    private

    def set_product
      @product = custom_find do
        Product.find(params[:product_id])
      end
    end

    def set_shopping_cart
      @shopping_cart = current_v1_user.shopping_cart
    end

    def set_custom_field
      @custom_field_ids = params[:custom_field_ids].select do |cf_id|
        @product.custom_fields.map(&:id).include? cf_id
      end
    end

    def set_option
      productable_op_ids = @product.productable.options.map(&:id)
      @option_ids = params[:option_ids].select do |op_id|
        productable_op_ids.include? op_id
      end
      # @odption = custom_find do
      #   @product.productable.options.find(params[:option_id])
      # end
      # @option_value = @option.values[params[:option_value]]
      # rescue_not_found('Option') if @option_value.nil?
    end

    def set_option_values
      @option_values = params[:option_values].select do |key, val|
        @option_ids.include?(key.to_i) &&
          Option.find(key.to_i).values.map(&:downcase).include?(val.downcase)
      end
    end

    def item_params
      params.require(:item).permit(:option_id, :option_values,
                                   :product_id, option_ids: [], custom_field_ids: [])
    end
  end
end


# {
#   "custom_field_ids": [150, 153, 140],
#   "option_ids": [23, 45, 76],
  # "option_value": {
  #   23: 'S',
  #   45: 'M',
  #   76: 'XL'
  # },
#   "quantity": 10
# }
