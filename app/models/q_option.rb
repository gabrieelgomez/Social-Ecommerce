class QOption < ApplicationRecord

  # Associations
  belongs_to :question

  # Validations
  validate :question_is_multiple, on: :create

  def question_is_multiple
    byebug
    unless question.q_type == 3
      errors.add(:question, 'Question is not multiple')
    end
  end
end
