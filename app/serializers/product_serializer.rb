class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :bar_code, :brand, :custom_fields, :currency, :description,
             :fields, :files, :height, :images, :num_ref, :options, :price_ranges,
             :price, :prominent, :rate, :service_type, :status, :stock, :virtual_product,
             :weight, :width, :tags, :subcategories, :build_products_relations, :productable
  # belongs_to :productable
end
