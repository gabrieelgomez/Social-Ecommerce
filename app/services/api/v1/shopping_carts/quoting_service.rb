module Api::V1::ShoppingCarts
  class QuotingService

    def self.handle_quote(cotizable, client, message, items, current_user, conversation)
      cotization = Cotization.new(
        cotizable: cotizable, # profile
        client: client, # user
        item_ids: items, # items or products
        stage: 'received',
        deal_type: DealType.first, # unknow
        conversation: conversation
      )
      ActiveRecord::Base.transaction do
        Item.destroy(items)

        if message.save! && cotization.save!
          Conversation.current_user = current_user
          @conversation = message.conversation.as_json(
            only: [
              :id
            ], methods: [
              :type_conversation, :sender_messageable, :receptor_messageable
            ], include: [
              :messages, :cotization
            ]
          )
        end

        # Create Notify, recipient, sender, type, message
        message = "¡<strong>#{client.clientable.name}</strong> le ha cotizado un producto, responde el mensaje!"
        return if cotizable.user == client.clientable
        Notification.create_notify_models(cotizable.user, client.clientable, 'cotization', message)
      end
    end

    def set_message(current_user, shopping_cart, item)
      main_text = "El usuario #{current_user.email} desea cotizar contigo los siguientes productos: \n"
      real_item = shopping_cart.items.find(item.id)
      main_text += "\n - #{real_item.product.name}: #{real_item.product.price} x #{real_item.quantity} \n"
      real_item.option_values.map do |key, opt|
        main_text += "\t - #{real_item.options.find(key).name}: #{opt} \n"
      end
      main_text
    end

  end
end
