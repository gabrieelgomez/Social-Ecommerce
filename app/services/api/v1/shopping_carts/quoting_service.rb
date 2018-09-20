module Api::V1::ShoppingCarts
  class QuotingService

    def self.simple_quote(message, items)
      ActiveRecord::Base.transaction do
        Item.destroy(items)
        message.save!
      end
    end
  end
end
