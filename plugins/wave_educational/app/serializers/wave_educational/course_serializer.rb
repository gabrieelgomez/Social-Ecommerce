class WaveEducational::CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :lasted_update, :language, :status, :private,
             :published, :price, :requeriments, :category, :teacher, :created_at, :updated_at

  def teacher
    object.teacher
  end

end
