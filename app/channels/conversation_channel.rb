class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "conversations-#{current_user.id}"
    logger.debug "---------------------------------------------"
    logger.debug "subscribed"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def create_message(data)
    logger.debug "---------------------------------------------"
    logger.debug "create_message"
    @message = data
    set_messageable
    @conversation = Conversation.user_conversations(@messageable).find @message['conversation_id']

    if @conversation
      Message.create(
        body: @message['body'],
        conversation_id: @conversation.id,
        messageable_id: @message['messageable_id'],
        messageable_type: @message['messageable_type']
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{user.id}",
        errors: 'Ha ocurrido un error al crear el mensaje.'
      )
    end
  end

  def set_messageable
    return @messageable = User.where(id: @message['messageable_id']).first if @message['messageable_type'] == 'User'
    @messageable = Profile.where(id: @message['messageable_id']).first
  end

  def current_user_conversations
    logger.debug "---------------------------------------------"
    logger.debug "current_user_conversations"
    Conversation.current_user = current_user
    @user = current_user
    @user_cotizations = Conversation.user_conversations(@user).where(type_messages: 'cotization').order(updated_at: :desc).select{|conv| conv.membership?(@user)}.as_json(
      only: [
        :id
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
        :id
      ], methods: [
        :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
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
    logger.debug "---------------------------------------------"
    logger.debug "own_profiles_conversations"
    @user   = current_user
    @profiles = @user.profiles.where(id: data['profile_ids'])
    @profiles = @user.profiles if @profiles.blank?

    @conversations = []

    @profiles_conversations = @profiles.map do |profile|
      Conversation.current_user = profile

      @users_chats = Conversation.user_conversations(profile).where.not(type_messages: 'cotization').order(updated_at: :desc).select{|conv| conv.membership?(profile)}.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable, :body_messages
        ]
      )

      @cotizations_chats = Conversation.user_conversations(profile).where(type_messages: 'cotization').order(updated_at: :desc).select{|conv| conv.membership?(profile)}.as_json(
        only: [
          :id
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

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      type: 'own_profile_conversations',
      body: {
        profile_conversations: @conversations
      }
    )
  end

  def get_all_open_chats
    logger.debug "---------------------------------------------"
    logger.debug "get_all_open_chats"
    Conversation.current_user = current_user
    @user = current_user
    # .select{|conv| conv.membership?(@user)}
    @user_chats = Conversation.user_conversations(@user).includes(:membership_conversations).where(membership_conversations: {open: true, memberable: @user}).order(updated_at: :desc).as_json(
      only: [
        :id
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

    @profiles = @user.profiles
    @conversations = []
    @profiles_conversations = @profiles.map do |profile|
      Conversation.current_user = profile
      chat = Conversation.user_conversations(profile).includes(:membership_conversations).where(membership_conversations: {open: true, memberable_type: 'Profile', memberable_id: profile.id}).order(updated_at: :desc).as_json(
        only: [
          :id
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
      @conversations << chat
    end
    @profiles_conversations = @profiles_conversations.flatten.uniq
    @conversations = @user_chats.concat(@profiles_conversations)
    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      type: 'get_all_open_chats',
      body: {
        conversations: @conversations
      }
    )
  end

  def update_open_conversation(data)
    logger.debug "---------------------------------------------"
    logger.debug "update_open_conversation"
    @current_user = current_user
    @data  = data
    Conversation.current_user = set_currentable
    @conversation = Conversation.user_conversations(@current_user).where(id: @data['conversation_id'].to_i).first
    @membership    = @conversation.own_membership
    if @membership.update(open: @data['open'])

      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        type: 'update_open_conversation',
        body: {
          id: @conversation.id,
          open: @membership.open
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

  def update_cotization(data)
    logger.debug "---------------------------------------------"
    logger.debug "update_cotization"
    @current_user = current_user
    @data  = data
    @cotization = Cotization.where(id: @data['cotization_id'].to_i).first

    if @cotization.update(stage: @data['stage'])
      Conversation.current_user = set_currentable
      @data = {
        type: 'update_cotization',
        body: {
          status_transaction: 'success',
          status_cotization: @data['stage'],
          cotization: @cotization,
          conversation: @cotization.conversation.as_json(
            only: [
              :id
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
        }
      }

      ActionCable.server.broadcast(
        "conversations-#{@cotization.cotizable.user.id}",
        @data
      )
      ActionCable.server.broadcast(
        "conversations-#{@cotization.client.clientable.id}",
        @data
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
    logger.debug "---------------------------------------------"
    logger.debug "destroy_conversation"
    @current_user = current_user
    @data  = data
    @conversation = Conversation.where(id: @data['conversation_id'].to_i).first
    Conversation.current_user = set_currentable
    @before_conversation = @conversation.as_json(
      only: [
        :id
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

    if @conversation.destroy
      @data = {
        type: "destroy_conversation",
        body: {
          conversation: @before_conversation,
          status_transaction: 'destroy successfull'
        }
      }

      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        @data
      )
      ActionCable.server.broadcast(
        "conversations-#{@before_conversation['receptor_messageable']['id']}",
        @data
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        status_transaction: 'failed',
        conversation: @before_conversation.errors
      )
    end
  end

  def set_currentable
    return @current_user if @data['currentable_id'].blank?
    @current_user = Profile.where(id: @data['currentable_id']).first
  end

end
