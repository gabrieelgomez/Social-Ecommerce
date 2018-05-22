class SendedWish < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :profile
  belongs_to :wish

  # Validations
  validates :profile_id, :user_id, :wish_id, presence: true
end
