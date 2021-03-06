module Api::V1::ShoppingCarts
  class CotizationController < ShoppingCartsController
    before_action :set_shopping_cart, only: %i[quote_it]
    before_action :set_profile,       only: %i[quote_it]
    before_action :set_conversation,  only: %i[quote_it]
    before_action :set_client,        only: %i[quote_it]


    def quote_it
      # conv = Conversation.get(@profile, current_v1_user, 'cotization')
      msg = @conversation.messages.new(
        body: set_cotization_message,
        messageable: current_v1_user
      )
      QuotingService.handle_quote(@profile, @client, msg, params[:items])
      render json: @conversation, status: 200
    end

    private

    def set_conversation
      @conversation = Conversation.get(@profile, current_v1_user, 'cotization')
    end

    def set_client
      @client = custom_find do
        Client.find_by!(clientable: current_v1_user)
      end
    end

    def set_items
      @items = params[:items].map do |item|
        Item.find(item)
      end
    end

    def set_cotization_message
      main_text = "El usuario #{current_v1_user.email} desea cotizar contigo los siguientes productos: \n"
      params[:items].map do |item|
        real_item = @shopping_cart.items.find(item)
        main_text += "\n - #{real_item.product.name}: #{real_item.product.price} x #{real_item.quantity} \n"
        real_item.option_values.map do |key, opt|
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
