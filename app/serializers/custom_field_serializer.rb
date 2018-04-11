class CustomFieldSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_id, :product
end
