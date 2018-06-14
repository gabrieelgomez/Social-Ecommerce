class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :height, :weight, :files, :width, :images,
             :price, :stock, :status, :num_ref, :bar_code, :currency,
             :virtual_product, :price_ranges, :tags, :custom_fields, :prominent,
             :service_type, :options, :product_relations, :productable
  # belongs_to :productable
end
