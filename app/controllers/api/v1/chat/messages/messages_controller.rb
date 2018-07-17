module Api::V1::Chat
  class Messages::MessagesController < ChatController

    private

    def set_conversation
      @conversation = custom_find {
        Conversation.user_conversations(@messageable).find params[:conversation_id]
      }
      # @conversation = @messageable.conversations.find(params[:conversation_id])
    end

    def set_messageable
      message = params[:message]
      return @messageable = current_v1_user if message[:messageable_id].nil?
      model = message[:messageable_type].downcase.pluralize.to_sym
      @messageable = custom_find {
        current_v1_user.try(model).find message[:messageable_id]
      }
    end

    def message_params
      params.require(:message).permit(:body).merge(messageable: @messageable)
    end
  end
end
