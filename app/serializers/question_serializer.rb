class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :question_type, :job_offer

  def question_type
    case object.q_type
    when 1 then 'Open'
    when 2 then 'Close'
    when 3 then 'Multiple'
    else 'Undefined question type'
    end
  end
end
