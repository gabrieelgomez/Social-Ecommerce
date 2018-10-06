class PriceRangeSerializer < ActiveModel::Serializer
  attributes :id, :stock, :price, :product
end