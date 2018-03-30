class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :height, :weight, :files, :width, :images, :productable, :price_ranges
  # belongs_to :productable
end