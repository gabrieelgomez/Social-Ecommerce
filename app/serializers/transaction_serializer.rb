class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :reference, :type_transfer, :status, :user, :wallet, :coin, :created_at, :updated_at
end
