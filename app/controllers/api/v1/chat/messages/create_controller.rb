module Api::V1::Chat::Messages
  class CreateController < MessagesController
    before_action :set_messageable

    def create
      @conversation = @messageable.conversations.find(params[:conversation_id])
      @message = @conversation.messages.new(message_params)
      if @message.save
        render json: @conversation, status: 200
      else
        render json: @conversation.errors, status: 500
      end
    end

    private

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
