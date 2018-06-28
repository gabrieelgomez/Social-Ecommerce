class ShoppingCartSerializer < ActiveModel::Serializer
  attributes :id, :state, :code, :user, :items

  # Custom response items
  def items
    object.items.map do |item|
      {
        id: item.id,
        product: Product.find(item.product_id),
        custom_fields: CustomField.find(item.custom_field_ids).as_json,
        options: select_option_val(item),
        quantity: item.quantity
      }
    end
  end

  # Serialize response option with only selected values
  def select_option_val(item)
    item.options.map do |it|
      it.as_json(only: %i[id name])
        .merge(
          values: it.values.select do |val|
                    item.option_values[it.id.to_s].try(:downcase) == val.try(:downcase)
                  end
        )
    end
  end
end
