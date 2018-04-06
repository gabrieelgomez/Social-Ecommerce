class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :nickname, :created_at, :updated_at, :offers
end
