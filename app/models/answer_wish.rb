class AnswerWish < ApplicationRecord

  # Relations
  belongs_to :profile
  belongs_to :sended_wish
  belongs_to :conversation

  # Validations
  validates :sended_wish_id, uniqueness: { message: 'This wish was already replied' }
  # validate :verify_exists
  after_create :update_wish

  def update_wish
    wish = sended_wish.wish
    wish.update(response: true, sent: true)
  end

end
