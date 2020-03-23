class WaveCitizen::CitizenSerializer < ActiveModel::Serializer
  attributes :id, :name, :banner, :nickname, :email, :avatar, :phone, :address,
             :web, :description, :status_citizen, :created_at, :updated_at,
             :deleted_at, :user, :type_candidacy

  # attributes *WaveCitizen::Citizen.column_names
end
