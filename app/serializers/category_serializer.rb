class CategorySerializer < ActiveModel::Serializer
  attributes :id, :cover, :name, :subcategories

  def subcategories
    object.subcategories.select{|subcategory|
      subcategory.products.count.positive?
    }.as_json(only: %i[id name category_id], methods: %i[products_charged])
  end

end
