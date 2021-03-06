class WaveWork::ExamSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :type_examenable, :examenable, :type_questions, :created_at, :updated_at

  def type_examenable
    object.examenable.class.to_s
  end

  def examenable
    object.examenable
  end

  def type_questions
    object.type_questions
  end

end
