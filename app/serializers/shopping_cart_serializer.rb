class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :state, :code, :user, :full_product, :custom_items

  def custom_items
    byebug
    self.object.items
  end
  # has_many :items
end
