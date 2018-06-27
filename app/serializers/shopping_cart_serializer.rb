class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :state, :code, :user, :items

  def items
    object.items.map do |item|
      {
        product: Product.find(item.product_id),
        custom_field: CustomField.find(item.custom_field_id),
        option: Option.find(item.option_id),
        option_value: item.option_value,
        quantity: item.quantity
      }
    end
  end
end
