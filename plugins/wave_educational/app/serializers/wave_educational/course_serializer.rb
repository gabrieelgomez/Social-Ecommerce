class WaveEducational::CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :lasted_update, :language, :status, :private,
             :published, :price, :requeriments, :category, :teacher

  def teacher
    object.teacher
  end

end
