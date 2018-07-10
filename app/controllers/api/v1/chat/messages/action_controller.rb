module Api::V1::Chat::Messages
  class ActionController < MessagesController
    before_action :set_messages_ids
    # before_action :set_conversation

    def make_them_read
      @multiple_messages.map do |message_id|
        Message.find(message_id).update(read: true) rescue 'error'
      end
      @conversation = Conversation.find params[:conversation_id]
      render json: @conversation, status: 200
    end

    private

    def set_messages_ids
      @multiple_messages = params[:messages].split('-').map &:to_i
    end
  end
end
