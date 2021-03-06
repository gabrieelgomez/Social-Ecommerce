module Api::V1::Chat::Conversations
  class ShowController < ConversationsController
    def current_user_conversations
      Conversation.current_user = current_v1_user
      @user = current_v1_user
      @user_cotizations = Conversation.user_conversations(@user).where(type_messages: 'cotization').order(updated_at: :desc).select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id, :open
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
        ],
          include: {
            cotization: {
              only: %i[id cotizable_type cotizable_id client_id price status stage token currency address text created_at conversation_id],
              methods: [:details]
            }
          }
      )

      @users_chats = Conversation.user_conversations(@user).where.not(type_messages: 'cotization').order(updated_at: :desc).select{|conv| conv.membership?(@user)}.as_json(
        only: [
          :id, :open
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
        ]
      )

      # @cotizations = Cotization.ransack(clientable_id: 13).result.as_json(only: %i[id stage status items], methods: %i[cotizable_id clientable], include: %i[items])

      @conversations = {
        type: 'current_user_conversations',
        body: {
          conversations: {
            user_conversations: @users_chats,
            cotizations_conversations: @user_cotizations
          }
        }
      }

      render json: @conversations
    end

    def own_profiles_conversations
      @user          = current_v1_user
      ids            = params[:profile_ids].try(:split, '-').try(:map, &:to_i)
      @profiles      = @user.profiles.where(id: ids)
      @profiles      = @user.profiles if @profiles.blank?
      @conversations = []

      @profiles_conversations = @profiles.map do |profile|
        Conversation.current_user = profile

        @users_chats = Conversation.user_conversations(profile).where.not(type_messages: 'cotization').order(updated_at: :desc).select{|conv| conv.membership?(profile)}.as_json(
          only: [
            :id, :open
          ], methods: [
            :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
          ]
        )

        @cotizations_chats = Conversation.user_conversations(profile).where(type_messages: 'cotization').order(updated_at: :desc).select{|conv| conv.membership?(profile)}.as_json(
          only: [
            :id, :open
          ], methods: [
            :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
          ],
            include: {
              cotization: {
                only: %i[id cotizable_type cotizable_id client_id price status stage token currency address text created_at conversation_id],
                methods: [:details]
              }
            }
        )

          # @cotizations = Cotization.where(cotizable_id: profile.id).as_json(only: %i[id stage status items], methods: %i[cotizable_id clientable], include: %i[items])

        chat = {
          profile: profile.as_json(only: %i[id title email photo type_profile]),
          user_conversations: @users_chats,
          cotizations_conversations: @cotizations_chats
          # cotizations: @cotizations
        }
        @conversations << chat
      end

      @profiles_conversations = {
        type: 'own_profile_conversations',
        body: {
          profile_conversations: @conversations.uniq
        }
      }

      render json: @profiles_conversations
    end
  end
end
