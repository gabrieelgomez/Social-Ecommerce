class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :height, :weight, :files, :width, :images, :productable, :price_ranges, :tags, :product_relations
  # belongs_to :productable
end
