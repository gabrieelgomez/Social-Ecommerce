class Postulation < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer
  has_many :postulations_questions, dependent: :destroy
end
