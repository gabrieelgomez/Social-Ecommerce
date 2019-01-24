class WaveEducational::SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :published, :course, :teacher

  # attributes *WaveEducational::Section.column_names

  def teacher
    object.course.teacher
  end

end
