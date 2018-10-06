module Api::V1::ShoppingCarts
  class QuotingService

    def self.handle_quote(cotizable, client, message, items)
      cotization = Cotization.new(
        cotizable: cotizable,
        client: client,
        item_ids: items,
        deal_type: DealType.first
      )
      ActiveRecord::Base.transaction do
        Item.destroy(items)
        message.save!
        cotization.save!
      end
    end
  end
end
