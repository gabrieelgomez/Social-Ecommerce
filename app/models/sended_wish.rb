class SendedWish < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :profile
  belongs_to :wish
  has_one :answer_wish

  # Validations
  validates :profile_id, :user_id, :wish_id, presence: true
  validates :user_id, uniqueness: { scope: :wish_id }
end
