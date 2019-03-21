class CotizationSerializer < ActiveModel::Serializer
  attributes :id, :stage, :status, :cotizable, :client, :items, :price, :deal_type

  # belongs_to :cotizable, polymorphic: true
  # belongs_to :user

  def client
    object.client.clientable
  end
end
