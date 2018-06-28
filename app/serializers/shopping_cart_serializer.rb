class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :state, :code, :user, :items

  def items
    object.items.map do |item|
      {
        id: item.id,
        product: Product.find(item.product_id),
        custom_fields: CustomField.find(item.custom_field_ids).as_json,
        option: Option.find(item.option_id),
        option_value: item.option_value,
        quantity: item.quantity
      }
    end
  end
end
