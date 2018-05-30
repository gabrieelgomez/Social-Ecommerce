module Api::V1::Chat::Messages
  class CreateController < MessagesController
    def create
      @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
      # byebug
      @message = @conversation.messages.new(message_params)
      @message.user = current_v1_user
      if @message.save
        render json: @conversation
      end
    end

    private

    def message_params
      params.require(:message).permit(:user_id, :body)
    end
  end
end
