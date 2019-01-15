class CotizationSerializer < ActiveModel::Serializer
  attributes :id, :price, :stage, :status, :deal_type, :cotizable, :client

  # belongs_to :cotizable, polymorphic: true
  # belongs_to :user
end
