class WaveEducational::TeacherSerializer < ActiveModel::Serializer
  # attributes :id, :user, :name, :email, :banner, :phone, :url, :address,
  #            :vision, :mission, :description
  attributes *WaveEducational::Teacher.column_names
end
