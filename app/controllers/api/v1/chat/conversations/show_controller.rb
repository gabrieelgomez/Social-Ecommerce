module Api::V1::Chat::Conversations
  class ShowController < ConversationsController
    def current_user_conversations
      @user = current_v1_user
      render json: Conversation.current_user_conversations(@user.id),
             status: 200
    end
  end
end
