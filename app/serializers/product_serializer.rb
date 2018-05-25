class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :height, :weight, :files, :width, :images,
             :price_ranges, :tags, :custom_fields,
             :options, :product_relations, :productable
  # belongs_to :productable
end
