class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :height, :weight, :rate, :files, :width, :images,
             :stock, :status, :num_ref, :bar_code, :currency, :description, :fields,
             :virtual_product, :price_ranges, :tags, :custom_fields, :prominent,
             :brand, :service_type, :options, :subcategories, :build_products_relations, :productable
  # belongs_to :productable
end
