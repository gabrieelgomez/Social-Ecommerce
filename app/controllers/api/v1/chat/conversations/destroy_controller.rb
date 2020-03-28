module Api::V1::Chat::Conversations
  class DestroyController < ConversationsController
    before_action :set_conversation
    before_action :set_conversation_membership

    def destroy
      if @membership.destroy
        render json: @conversation, status: 200
      else
        render json: 'Error', status: 422
      end
    end

    private

    def set_conversation
      @conversation = custom_find {
        Conversation.find(params[:conversation_id])
      }
    end

    def set_conversation_membership
      @membership = custom_find { 
        current_v1_user.membership_conversations.find_by(conversation: @conversation)
      }
    end
  end
end
