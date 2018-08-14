class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :nickname, :avatar, :url,
             :created_at, :updated_at, :offers, :censured, :slug,
             :dni, :gender, :birth_day, :country
end
