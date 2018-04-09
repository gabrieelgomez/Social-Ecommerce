class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :height, :weight, :files, :width, :images, :productable, :price_ranges, :tags
  # belongs_to :productable
end