class WalletSerializer < ActiveModel::Serializer
  attributes :id, :token, :balance, :user, :coin, :created_at, :updated_at
end
