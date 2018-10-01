module Api::V1::CustomerManagements
  class CustomerManagementSerializer < ActiveModel::Serializer
    attributes :id, :state#, :profile#, :clients

    has_many :clients
    belongs_to :profile
  end
end
