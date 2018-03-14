class PymeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :type_profile, :title, :name
end
