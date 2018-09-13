class CategorySerializer < ActiveModel::Serializer
  attributes :id, :cover, :name, :subcategories
end
