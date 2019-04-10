module Api::V1::Chat::Conversations
  class ShowController < ConversationsController
    def current_user_conversations
      Conversation.current_user = current_v1_user
      @user = current_v1_user
      @user_cotizations = Conversation.user_conversations(@user).where(type_messages: 'cotization').select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id, :open
        ], methods: [
          :type_conversation, :sender_messageable, :receptor_messageable
        ],
          include: {
            messages:{
              only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at]
            },
            cotization: {
              only: %i[id cotizable_type cotizable_id client_id price status stage token currency address text created_at conversation_id],
              methods: [:details]
            }
          }
      )

      @users_chats = Conversation.user_conversations(@user).where.not(type_messages: 'cotization').select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id, :open
        ], methods: [
          :type_conversation, :sender_messageable, :receptor_messageable
        ], include: [
          :messages
        ]
      )

      # @cotizations = Cotization.ransack(clientable_id: 13).result.as_json(only: %i[id stage status items], methods: %i[cotizable_id clientable], include: %i[items])

      @conversations = {
        user_conversations: @users_chats,
        cotizations_conversations: @user_cotizations
        # cotizations: @cotizations
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
            :id, :open
          ], methods: [
            :type_conversation, :sender_messageable, :receptor_messageable
          ], include: [
            :messages
          ]
        )

        @cotizations_chats = Conversation.user_conversations(profile).where(type_messages: 'cotization').select{|conv| conv.membership?(profile)}.as_json(
          only: [
            :id, :open
          ], methods: [
            :type_conversation, :sender_messageable, :receptor_messageable
          ],
            include: {
              messages:{
                only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at]
              },
              cotization: {
                only: %i[id cotizable_type cotizable_id client_id price status stage token currency address text created_at conversation_id],
                methods: [:details]
              }
            }
        )

        # @cotizations = Cotization.where(cotizable_id: profile.id).as_json(only: %i[id stage status items], methods: %i[cotizable_id clientable], include: %i[items])

        @conversations = {
          profile: profile.as_json(only: %i[id title email photo type_profile]),
          user_conversations: @users_chats,
          cotizations_conversations: @cotizations_chats
          # cotizations: @cotizations
        }
      end
      render json: @profiles_conversations
    end
  end
end
