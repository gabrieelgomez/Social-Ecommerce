class CotizationSerializer < ActiveModel::Serializer
  attributes :id, :price

  belongs_to :cotizable, polymorphic: true
  belongs_to :user
end
