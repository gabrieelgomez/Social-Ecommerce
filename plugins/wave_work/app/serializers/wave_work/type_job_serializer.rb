class WaveWork::TypeJobSerializer < ActiveModel::Serializer
  # attributes :id, :title, :subareas
  attributes *WaveWork::TypeJob.column_names
end
