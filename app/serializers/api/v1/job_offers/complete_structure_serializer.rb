module Api::V1::JobOffers
  class CompleteStructureSerializer < ActiveModel::Serializer
    attributes :id, :status, :profile_id, :photo, :charge, :location, :salary,
               :day_rutine_type, :job_type, :details
  end
end
