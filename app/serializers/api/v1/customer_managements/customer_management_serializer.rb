module Api::V1::CustomerManagements
  class CustomerManagementSerializer < ActiveModel::Serializer
    attributes :id, :state, :profile
  end
end
