class ItemSerializer < ActiveModel::Serializer
  attributes :id, :shopping_cart, :product, :custom_field_ids,
             :option_ids, :option_values
  # belongs_to :custom_field
end
