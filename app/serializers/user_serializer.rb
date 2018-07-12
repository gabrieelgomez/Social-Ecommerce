class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :nickname, :avatar,
             :created_at, :updated_at, :offers, :censured
end
