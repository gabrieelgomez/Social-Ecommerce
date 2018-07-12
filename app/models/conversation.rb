class Conversation < ApplicationRecord
  belongs_to :senderable, polymorphic: true
  belongs_to :recipientable, polymorphic: true
  has_many :messages, dependent: :destroy

  validates :senderable_id, uniqueness: {
    scope: %i[senderable_type recipientable_id recipientable_id]
  }

  scope :between, -> (sender, recipient) do
    where(senderable: sender, recipientable: recipient).or(
      where(senderable: recipient, recipientable: sender)
    )
  end

  scope :current_user_conversations, -> (current_user) do
    where(senderable: current_user).or(where(recipientable: current_user))
  end

  def asdasd
    {
      byebug: 'byebug'
    }
  end

  def self.get(sender, recipient)
    # byebug
    conversation = between(sender, recipient).first
    return conversation if conversation.present?

    create(senderable: sender, recipientable: recipient)
  end

  def opposed_chater(chater)
    chater == recipientable ? senderable : recipientable
  end
end
