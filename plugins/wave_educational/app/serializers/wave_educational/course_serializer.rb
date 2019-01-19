class WaveEducational::CourseSerializer < ActiveModel::Serializer
  # attributes :id, :user_id, :name, :email, :banner, :phone, :url, :address,
  #            :vision, :mission, :description

  attributes *WaveEducational::Course.column_names
end
