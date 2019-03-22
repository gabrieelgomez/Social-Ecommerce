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
      @user          = current_v1_user
      ids            = params[:profile_ids].try(:split, '-').try(:map, &:to_i)
      @profiles      = @user.profiles.where(id: ids)
      @profiles      = @user.profiles if @profiles.empty?

      @profiles_conversations = @profiles.map do |profile|
        Conversation.current_user = profile

        @users_chats = Conversation.user_conversations(profile).where.not(type_messages: 'cotization').select{|conv| conv.membership?(profile)}.as_json(
          only: [
            :id
          ], methods: [
            :type_conversation, :sender_messageable, :receptor_messageable
          ], include: [
            :messages
          ]
        )

        @cotizations_chats = Conversation.user_conversations(profile).where(type_messages: 'cotization').select{|conv| conv.membership?(profile)}.as_json(
          only: [
            :id
          ], methods: [
            :type_conversation, :sender_messageable, :receptor_messageable
          ], include: [
            :messages
          ]
        )

        @conversations = {
          profile: profile.as_json(only: %i[id title email photo type_profile]),
          user_conversations: @users_chats,
          cotizations_conversations: @cotizations_chats
        }
      end
      render json: @profiles_conversations
    end
  end
end
