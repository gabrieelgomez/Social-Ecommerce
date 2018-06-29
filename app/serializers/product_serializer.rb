class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :bar_code, :cover, :brand, :custom_fields, :currency, :description,
             :files, :height, :num_ref, :options, :price_ranges,
             :price, :prominent, :rate, :service_type, :status, :stock, :virtual_product,
             :weight, :width, :photos, :documents, :tags, :subcategory_ids, :build_products_relations, :productable
  # belongs_to :productable
end
