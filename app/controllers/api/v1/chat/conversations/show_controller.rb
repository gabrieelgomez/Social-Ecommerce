module Api::V1::Chat::Conversations
  class ShowController < ConversationsController
    def current_user_conversations
      Conversation.current_user = current_v1_user
      @user = current_v1_user

      @user_conversations = Conversation.user_conversations(@user).select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :sender_user, :receptor_user
        ], include: [
          :messages
        ]
      )

      @conversations = {
        user_conversations: @user_conversations,
        cotizations_conversations: nil
      }

      render json: @conversations
    end

    def own_profiles_conversations
      @user = current_v1_user
      convs = @user.profiles.map do |prof|
        prof.as_json.merge(
          conversations: Conversation.user_conversations(prof).select{|conv| conv.membership?(@user)}
                                     .as_json(include: [:messages])
        )
      end
      render json: convs
    end
  end
end
