class CustomFieldSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_ids#, :product_id, :products
end
