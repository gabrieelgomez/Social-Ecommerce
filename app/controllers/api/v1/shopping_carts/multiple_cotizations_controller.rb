module Api::V1::ShoppingCarts
  class MultipleCotizationsController < ShoppingCartsController

    def multiple_quotes

      @conversations = []

      params[:data].count.times do |x|

        cotization    = params[:data][x]
        profile       = Profile.find(cotization[:profile_id])
        shopping_cart = current_v1_user.shopping_cart

        items = []
        cotization[:items].count.times do |y|
          item    = cotization[:items][y]
          product = Product.find(item[:product_id])

          custom_field_ids = item[:custom_field_ids].select do |cf_id|
            product.custom_fields.map(&:id).include? cf_id
          end

          productable_op_ids = product.productable.options.map(&:id)
          option_ids = item[:option_ids].select do |op_id|
            productable_op_ids.include? op_id
          end

          # option_values = item[:option_values].select do |key, val|
          #   option_ids.include?(key.to_i) &&
          #     Option.find(key.to_i).values.map(&:downcase).include?(val.downcase)
          # end

          item = shopping_cart.items.new(product_id: product.id,
                                           custom_field_ids: custom_field_ids,
                                           option_ids: option_ids,
                                           option_values: JSON.parse(item[:option_values].to_json),
                                           quantity: item[:quantity])
          item.save
          logger.debug item.inspect
          logger.debug "---------------------------------------------"
          items << item.id
        end # Each by per item product of cotization

        # conversation  = Conversation.get(profile, current_v1_user, 'cotization')
        conversation  = Conversation.create(senderable: current_v1_user, recipientable: profile, type_messages: 'cotization')
        client        = Client.find_by!(clientable: current_v1_user)

        msg = conversation.messages.new(
          body: set_cotization_message(items, shopping_cart),
          messageable: current_v1_user
        )
        logger.debug msg.inspect
        logger.debug "---------------------------------------------"

        logger.debug "---------------------------------------------"
        logger.debug conversation.inspect
        logger.debug "---------------------------------------------"

        Api::V1::ShoppingCarts::QuotingService.handle_quote(profile, client, msg, items, current_v1_user, conversation)
        @conversations << conversation

      end # Each by per cotization profile

      render json: @conversations, status: 200
    end

    private

    def set_cotization_message(items, shopping_cart)
      main_text = "El usuario #{current_v1_user.email} desea cotizar contigo los siguientes productos: \n"
      items.map do |item|
        real_item = shopping_cart.items.find(item)
        main_text += "\n - #{real_item.product.name}: #{real_item.product.price} x #{real_item.quantity} \n"
        real_item.option_values.map do |option|
          key = option.keys.first
          value = option.values.first
          main_text += "\t - #{real_item.options.find(key).name}: #{value} \n"
        end
      end
      main_text
    end

  end
end
