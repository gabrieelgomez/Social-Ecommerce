module Api::V1::Chat::Conversations
  class ShowController < ConversationsController
    def current_user_conversations
      Conversation.current_user = current_v1_user
      @user = current_v1_user
      @contizations = Conversation.user_conversations(@user).where(type_messages: 'cotization').select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :sender_messageable, :receptor_messageable
        ], include: [
          :messages
        ]
      )

      @users_chats = Conversation.user_conversations(@user).where.not(type_messages: 'cotization').select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :sender_messageable, :receptor_messageable
        ], include: [
          :messages
        ]
      )

      @conversations = {
        user_conversations: @users_chats,
        cotizations_conversations: @contizations
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
