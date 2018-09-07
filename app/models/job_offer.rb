class JobOffer < ApplicationRecord
  belongs_to :profile
  has_many :questions, dependent: :destroy
end
