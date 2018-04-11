class OptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_id, :product
end
