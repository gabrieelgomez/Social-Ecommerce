class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :nickname, :avatar, :url, :provider, :banner, :uid, :lastname,
             :created_at, :updated_at, :offers, :censured, :slug, :phone_one, :phone_two, :description,
             :dni, :gender, :birth_date, :age, :country, :omniauth_provider, :omniauth_id, :roles
end
