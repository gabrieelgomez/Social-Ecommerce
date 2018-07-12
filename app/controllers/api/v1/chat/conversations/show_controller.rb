module Api::V1::Chat::Conversations
  class ShowController < ConversationsController
    def current_user_conversations
      @user = current_v1_user
      render json: Conversation.current_user_conversations(@user),
             status: 200
    end

    def own_profiles_conversations
      @user = current_v1_user
      convs = @user.profiles.map do |prof|
        prof.as_json.merge(
          conversations: Conversation.current_user_conversations(prof)
                                     .as_json(include: [:messages])
        )
      end
      render json: convs
    end
  end
end
