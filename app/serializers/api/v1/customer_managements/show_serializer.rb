module Api::V1::CustomerManagements
  class ShowSerializer < ActiveModel::Serializer
    attributes :id, :state
  end
end
