class AnswerWish < ApplicationRecord

  # Relations
  belongs_to :profile
  belongs_to :sended_wish
  belongs_to :conversation

  # Validations
  validates :sended_wish_id, uniqueness: { message: 'This wish was already replied' }
  # validate :verify_exists
  after_create :send_notify_cable

  after_create :update_wish

  def update_wish
    wish = sended_wish.wish
    wish.update(response: true, sent: true)
  end


  def send_notify_cable
    set_profile
    set_user
  end

  def set_profile
    Conversation.current_user = sended_wish.profile
    @data = {
      type: 'new_answer_wish',
      body: self.conversation.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
        ]
      )
    }

    ActionCable.server.broadcast(
      "conversations-#{sended_wish.profile.user.id}",
      @data
    )
  end

  def set_user
    Conversation.current_user = sended_wish.user
    @data = {
      type: 'new_answer_wish',
      body: self.conversation.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
        ]
      )
    }

    ActionCable.server.broadcast(
      "conversations-#{sended_wish.user.id}",
      @data
    )
  end

end
