class Question < ApplicationRecord
  belongs_to :job_offer
  has_many :options, class_name: 'QOption', dependent: :destroy
  has_many :postulations_questions, dependent: :destroy

  validates :q_type, numericality: { only_integer: true },
                     inclusion:    { in: [0, 1, 2, 3] }

  def options
    return super if q_type == 3

    []
  end
end
