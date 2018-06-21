class ItemSerializer < ActiveModel::Serializer
  attributes :id, :shopping_car, :product, :custom_field, :option, :option_value
  # belongs_to :custom_field
end
