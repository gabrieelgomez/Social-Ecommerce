module Api::V1::ShoppingCarts
  class QuotingService

    def self.handle_quote(cotizable, client, message, items)
      cotization = Cotization.new(
        cotizable: cotizable, # profile
        client: client, # user
        item_ids: items, # items or products
        deal_type: DealType.first # unknow
      )
      ActiveRecord::Base.transaction do
        Item.destroy(items)
        message.save!
        cotization.save!

        # Create Notify, recipient, sender, type, message
        message = "¡<strong>#{client.clientable.name}</strong> le ha cotizado un producto, responde el mensaje!"
        return if cotizable.user == client.clientable
        Notification.create_notify_models(cotizable.user, client.clientable, 'cotization', message)
      end
    end
  end
end
