class Question < ApplicationRecord
  belongs_to :job_offer
  has_many :q_options, -> { where q_type: 'multiple'}
end
