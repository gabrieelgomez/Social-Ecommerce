class WaveWork::AreaSerializer < ActiveModel::Serializer
  # attributes :id, :title, :subareas
  attributes *WaveWork::Area.column_names
end
