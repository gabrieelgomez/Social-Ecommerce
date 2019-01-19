class WaveEducational::ClassSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :content, :status, :published, :section, :course

  # attributes *WaveEducational::Class.column_names

  def course
    object.section.course
  end

end
