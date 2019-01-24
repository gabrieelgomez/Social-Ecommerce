class WaveEducational::TypeQuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :question_type, :question, :open_answer, :boolean_answer,
             :alternative_answer, :type_examenable, :exam

  def exam
    object.exam
  end

  def type_examenable
    object.exam.examenable.class.to_s
  end

end
