class WaveEducational::SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :published, :course, :teacher, :created_at, :updated_at

  # attributes *WaveEducational::Section.column_names

  def teacher
    object.course.teacher
  end

end
