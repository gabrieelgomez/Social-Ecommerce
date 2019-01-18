class Intranet::GroupSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :description, :banner, :cover
end
