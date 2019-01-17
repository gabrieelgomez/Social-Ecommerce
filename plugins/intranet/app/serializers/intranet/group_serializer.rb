module Intranet
  class GroupSerializer < ActiveModel::Serializer
    attributes :id, :title, :subtitle, :description, :banner, :cover
  end
end
