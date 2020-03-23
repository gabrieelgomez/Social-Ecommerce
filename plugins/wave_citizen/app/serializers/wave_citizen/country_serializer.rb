class WaveCitizen::CountrySerializer < ActiveModel::Serializer
  # attributes :id, :name, :country_code, :currency, :created_at, :updated_at,
  #            :deleted_at, :user

  attributes *WaveCitizen::Country.column_names
end
