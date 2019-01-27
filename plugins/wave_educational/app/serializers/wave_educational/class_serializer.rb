class WaveEducational::ClassSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :content, :status, :published, :section, :course, :created_at, :updated_at

  # attributes *WaveEducational::Class.column_names

  def course
    object.section.course
  end

end
