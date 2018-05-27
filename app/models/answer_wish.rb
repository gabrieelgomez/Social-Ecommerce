class AnswerWish < ApplicationRecord

  # Relations
  belongs_to :profile
  belongs_to :sended_wish

  # Validations
  validates :sended_wish_id, uniqueness: { message: 'This wish was already replied' }
  # validate :verify_exists
end
