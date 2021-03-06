class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :bar_code, :cover, :brand, :custom_fields, :currency, :description,
             :files, :height, :num_ref, :options, :price_ranges, :links, :url_get, :type_profile,
             :price, :prominent, :rate, :service_type, :status, :stock, :virtual_product, :states_codes, :countries_codes,
             :weight, :width, :photos, :documents, :tags, :subcategories, :build_products_relations, :productable
  # belongs_to :productable
end
