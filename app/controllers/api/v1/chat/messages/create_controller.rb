module Api::V1::Chat::Messages
  class CreateController < MessagesController
    before_action :set_messageable
    before_action :set_conversation

    def create
      @message = @conversation.messages.new(message_params)
      if @message.save
        render json: @conversation, status: 200
      else
        render json: @conversation.errors, status: 422
      end
    end
  end
end
