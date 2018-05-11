class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :height, :weight, :files, :width, :images,
             :productable, :price_ranges, :tags, :custom_fields,
             :options, :product_relations
  # belongs_to :productable
end
