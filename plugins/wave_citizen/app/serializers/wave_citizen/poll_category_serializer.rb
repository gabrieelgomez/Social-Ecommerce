class WaveCitizen::PollCategorySerializer < ActiveModel::Serializer
  # attributes :id, :name, :banner, :nickname, :email, :avatar, :phone, :address,
  #            :web, :description, :status_citizen, :created_at, :updated_at,
  #            :deleted_at, :user

  attributes *WaveCitizen::PollCategory.column_names
  attributes :country
end
