class WaveWork::TypeHierarchySerializer < ActiveModel::Serializer
  # attributes :id, :title, :subareas
  attributes *WaveWork::TypeHierarchy.column_names
end
