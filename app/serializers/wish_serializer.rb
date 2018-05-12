class WishSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget, :description, :user,
             :wisheable, :priority
end
