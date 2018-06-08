class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :height, :weight, :files, :width, :images,
             :price, :stock, :status, :num_ref, :bar_code, :currency,
             :price_ranges, :tags, :custom_fields, :description,
             :options, :product_relations, :productable
  # belongs_to :productable
end
