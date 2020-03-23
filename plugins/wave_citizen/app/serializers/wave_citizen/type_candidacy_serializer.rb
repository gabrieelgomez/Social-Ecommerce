class WaveCitizen::TypeCandidacySerializer < ActiveModel::Serializer
  # attributes :id, :name, :banner, :nickname, :email, :avatar, :phone, :address,
  #            :web, :description, :status_citizen, :created_at, :updated_at,
  #            :deleted_at, :user

  attributes *WaveCitizen::TypeCandidacy.column_names
  attributes :country
end
