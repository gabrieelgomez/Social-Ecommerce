module Api::V1::Wishes::AnswerWishes
  class CreateController < AnswerWishesController

    before_action :set_profile
    before_action :set_sended_wish

    def create
      @answer = @profile.answer_wishes.new(answer_wish_params)

      senderable    = @answer.sended_wish.profile
      recipientable = @answer.sended_wish.user
      Conversation.current_user = senderable
      conversation  = Conversation.create(senderable: senderable, recipientable: recipientable, type_messages: 'wish')

      msg = conversation.messages.new(
        body: @answer.message,
        messageable: senderable
      )

      msg.save!

      @answer.conversation_id = conversation.id

      if @answer.save
        render json: @answer, current_user: senderable, status: 200
      else
        render json: @answer.errors, status: 500
      end
    end
  end
end
