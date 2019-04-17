class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "conversations-#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def create_message(data)
    @message = data
    set_messageable
    @conversation = Conversation.user_conversations(@messageable).find @message['conversation_id']

    message = Message.create(
      body: @message['body'],
      conversation_id: @conversation.id,
      messageable_id: @messageable.id
    )

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      type: 'message',
      body: message.as_json
    )
  end

  def set_messageable
    return @messageable = current_user if @message['messageable_id'].nil?
    model = @message['messageable_type'].downcase.pluralize.to_sym
    @messageable = current_user.try(model).find @message['messageable_id']
  end


  def current_user_conversations
    Conversation.current_user = current_user
    @user = current_user
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

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      type: 'current_user_conversations',
      body: {
        conversations: {
          user_conversations: @users_chats,
          cotizations_conversations: @user_cotizations
        }
      }
    )
  end

  def own_profiles_conversations(data)
    @user   = current_user
    @profiles = @user.profiles.where(id: data['profile_ids'])
    @profiles = @user.profiles if @profiles.blank?

    @conversations = []

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

      chat = {
        profile: profile.as_json(only: %i[id title email photo type_profile]),
        user_conversations: @users_chats,
        cotizations_conversations: @cotizations_chats
        # cotizations: @cotizations
      }
      @conversations << chat
    end

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      type: 'own_profile_conversations',
      body: {
        profile_conversations: @conversations
      }
    )
  end

  def update_cotization(data)
    cotization = data
    @cotization = Cotization.where(id: cotization['cotization_id'].to_i).first

    if @cotization.update(stage: cotization['stage'])
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        type: 'update_cotization',
        body: {
          status_transaction: 'success',
          status_cotization: cotization['stage'],
          cotization: @cotization,
          conversation: @cotization.conversation.as_json(
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
        }
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        status_transaction: 'failed',
        cotization: @cotization.errors
      )
    end
  end

  def destroy_conversation(data)
    conversation  = data
    @conversation = Conversation.where(id: conversation['conversation_id'].to_i).first
    if @conversation.destroy
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        type: "destroy_conversation",
        body: {
          conversation: @conversation,
          status_transaction: 'destroy successfull'
        }
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        status_transaction: 'failed',
        conversation: @conversation.errors
      )
    end
  end

end
