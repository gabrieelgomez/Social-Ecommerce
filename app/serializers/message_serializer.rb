class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :read, :image, :file, :products
  belongs_to :messageable
  belongs_to :conversation
end
