class WaveEducational::TeacherSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :email, :banner, :phone, :url, :address,
             :vision, :mission, :description
end
