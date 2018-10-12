class PostulationSerializer < ActiveModel::Serializer
  attributes :id, :answers, :user, :job_offer

  def answers
    object.postulations_questions.map do |answer|
      {
        question: answer.question.title,
        answer: answer.answer
      }
    end
  end
end
