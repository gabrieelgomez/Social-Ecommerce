class Conversation < ApplicationRecord
  cattr_accessor :current_user

  belongs_to :senderable, polymorphic: true
  belongs_to :recipientable, polymorphic: true
  has_many :messages, dependent: :destroy
  has_many :membership_conversations, dependent: :destroy
  after_create :assign_conversation_membership
  after_create :create_crm_client, if: :between_client_and_profile?

  # validates :senderable_id, uniqueness: {
  #   scope: %i[senderable_type recipientable_id]
  # }
  validates :senderable_id, :senderable_type, :recipientable_id,
            :recipientable_type, presence: true

  validates :type_messages, uniqueness: {
    scope: %i[senderable_id senderable_type recipientable_id recipientable_type]
  }

  scope :between, ->(sender, recipient) do
    where(senderable: sender, recipientable: recipient).or(
      where(senderable: recipient, recipientable: sender)
    )
  end

  scope :user_conversations, ->(current_user) do
    where(senderable: current_user).or(where(recipientable: current_user))
  end

  scope :user_conversations, ->(current_user) do
    where(senderable: current_user).or(where(recipientable: current_user))
  end

  def membership?(member)
    membership_conversations.where(memberable: member).exists?
  end

  def create_crm_client
    profile = senderable.is_a?(Profile) ? senderable : recipientable
    user = senderable.is_a?(User) ? senderable : recipientable
    CreatedByService.build_client(
      profile.customer_management,
      user,
      type_messages
    )
  end

  def between_client_and_profile?
    (senderable.is_a?(Profile) && recipientable.is_a?(User)) ||
      (senderable.is_a?(User) && recipientable.is_a?(Profile))
  end

  def sender
    return senderable.as_json(methods: [:type_profile]) if senderable.is_a? Profile

    senderable.as_json
  end

  def recipient
    return recipientable.as_json(methods: [:type_profile]) if recipientable.is_a? Profile

    recipientable.as_json
  end

  def type_conversation
    type_messages
  end

  def sender_messageable
    current_user.as_json(only: [:id, :name], methods: [:type])
  end

  def receptor_messageable
    set_entity
  end

  def set_entity
    if senderable.id != current_user.id && senderable.class.to_s != 'User'
      return senderable.as_json(only: [:id], methods: [:type, :name]) if senderable.is_a? Profile
      senderable.as_json
    elsif recipientable.id != current_user.id && recipientable.class.to_s != 'User'
      return recipientable.as_json(only: [:id], methods: [:type, :name]) if recipientable.is_a? Profile
      recipientable.as_json
    elsif senderable.id != current_user.id && senderable.class.to_s == 'User'
      senderable.as_json(only: [:id, :name], methods: [:type])
    elsif recipientable.id != current_user.id && recipientable.class.to_s == 'User'
      recipientable.as_json(only: [:id, :name], methods: [:type])
    end
  end

  def self.get(sender, recipient, type_conv=nil)
    conversations = between(sender, recipient)
    if sender.is_a?(User) && recipient.is_a?(User)
      type_messages = 'user'
    elsif type_conv == 'cotization'
      type_messages = 'cotization'
    elsif sender.is_a? Profile or recipient.is_a? Profile
      type_messages = 'profile'
    elsif sender.has_role? :superadmin or recipient.has_role? :superadmin
      type_messages = 'manager'
    end
    conversation = conversations.find_by(type_messages: type_messages)
    return conversation if conversation.present?

    create(senderable: sender, recipientable: recipient, type_messages: type_messages)
  end

  def opposed_chater(chater)
    chater == recipientable ? senderable : recipientable
  end

  def assign_conversation_type
    if senderable.is_a? User and recipientable.is_a? User
      update(type_messages: 'user')
    elsif senderable.is_a? Profile or recipientable.is_a? Profile
      update(type_messages: 'profile')
    elsif senderable.has_role? :superadmin or recipientable.has_role? :superadmin
      update(type_messages: 'manager')
    end
  end

  def assign_conversation_membership
    MembershipConversation.create(conversation: self, memberable: recipientable)
    MembershipConversation.create(conversation: self, memberable: senderable)
  end
end
