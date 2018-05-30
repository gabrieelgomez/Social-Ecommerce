class Conversation < ApplicationRecord
  belongs_to :senderable, polymorphic: true
  belongs_to :recipientable, polymorphic: true
  has_many :messages, dependent: :destroy

  validates :senderable, uniqueness: { scope: :recipientable }

  scope :between, -> (sender, recipient) do
    where(senderable: sender, recipientable: recipient).or(
      where(senderable: recipient, recipientable: sender)
    )
  end

  def self.get(sender, recipient)
    conversation = between(sender, recipient).first
    return conversation if conversation.present?

    create(senderable: sender, recipientable: recipient)
  end

  def opposed_chater(chater)
    chater == recipientable ? senderable : recipientable
  end
end
