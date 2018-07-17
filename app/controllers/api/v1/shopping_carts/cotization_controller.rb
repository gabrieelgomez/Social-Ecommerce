module Api::V1::ShoppingCarts
  class CotizationController < ShoppingCartsController
    before_action :set_shopping_cart, only: %i[quote_it]
    before_action :set_profile, only: %i[quote_it]


    def quote_it
      conv = Conversation.get(@profile, current_v1_user)
      conv.update(type_messages: 'cotization')
      conv.messages.create(
        body: set_cotization_message,
        messageable: current_v1_user
      )
      render json: conv, status: 200
      # byebug
    end

    private

    def set_cotization_message
      main_text = "El usuario #{current_v1_user.email} desea cotizar contigo los siguientes productos: \n"
      params[:items].map do |item|
        real_item = @shopping_cart.items.find(item)
        main_text += "\n - #{real_item.product.name}: #{real_item.product.price} \n"
        real_item.option_values.map do |key, opt|
          # byebug
          main_text += "\t - #{real_item.options.find(key).name}: #{opt} \n"
        end
      end
      main_text
    end

    def set_profile
      @profile = custom_find {
        Profile.find params[:profile_id]
      }
    end
  end
end