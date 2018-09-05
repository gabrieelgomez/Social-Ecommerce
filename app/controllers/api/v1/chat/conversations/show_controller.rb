module Api::V1::Chat::Conversations
  class ShowController < ConversationsController
    def current_user_conversations
      @user = current_v1_user
      convs = @user.profiles.map do |prof|
        prof.as_json.merge(
          conversations: Conversation.user_conversations(prof).select{|conv| conv.membership?(prod)}
                                     .as_json(
                                       only: [:id, :type_messages],
                                       methods: [
                                         :sender,
                                         :recipient
                                       ],
                                       include: [
                                         :messages
                                       ]
                                     )
        )
      end
      render json: Conversation.user_conversations(@user).select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id, :type_messages
        ], methods: [
          :sender, :recipient
        ], include: [
          :messages
        ]
      )
      .push(
        profiles: convs || []
      )
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
