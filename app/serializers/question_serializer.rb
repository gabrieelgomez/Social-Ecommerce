class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :job_offer, :q_type
end
