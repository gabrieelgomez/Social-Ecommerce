class ItemSerializer < ActiveModel::Serializer
  attributes :id, :shopping_cart, :product, :custom_field, :option_id, :option_value
  # belongs_to :custom_field
end
