class WaveCitizen::ItemSerializer < ActiveModel::Serializer
  attributes *WaveCitizen::Item.column_names
  attributes :poll
end
