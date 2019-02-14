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
    @message = data['message']
    set_messageable
    @conversation = Conversation.user_conversations(@messageable).find message['conversation_id']

    message = Message.create(
      body: message['body'],
      conversation_id: @conversation.id,
      messageable_id: @messageable.id
    )

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      message: message.as_json
    )
  end

  def set_messageable
    return @messageable = current_user if @message['messageable_id'].nil?
    model = @message['messageable_type'].downcase.pluralize.to_sym
    @messageable = current_user.try(model).find @message['messageable_id']
  end


  def current_user_conversations
    @user = current_user
    # convs = @user.profiles.map do |prof|
    #   prof.as_json.merge(
    #     conversations: Conversation.user_conversations(prof).select{|conv| conv.membership?(prof)}
    #                                .as_json(
    #                                  only: [:id, :type_messages],
    #                                  methods: [
    #                                    :sender,
    #                                    :recipient
    #                                  ],
    #                                  include: [
    #                                    :messages
    #                                  ]
    #                                )
    #   )
    # end
    @conversations = Conversation.user_conversations(@user).select{|conv| conv.membership?(@user)}.as_json(
      only: [
        :id, :type_messages
      ], methods: [
        :sender, :recipient
      ], include: [
        :messages
      ]
    )
    # .push(
    #   profiles: convs || []
    # )

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      conversations: @conversations
    )
  end

  def own_profiles_conversations
    @user = current_user
    @conversations = @user.profiles.map do |prof|
      prof.as_json.merge(
        conversations: Conversation.user_conversations(prof).select{|conv| conv.membership?(@user)}
                                   .as_json(include: [:messages])
      )
    end

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      conversations: @conversations
    )
  end

  def update_cotization(data)
    cotization = data['cotization']
    @cotization = Cotization.find cotization['cotization_id']

    if @cotization.update(cotization['stage'])
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        cotization: @cotization
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        cotization: @cotization.errors
      )
    end
  end

  def destroy_cotization(data)
    cotization = data['cotization']
    @cotization = Cotization.find cotization['cotization_id']

    if @cotization.destroy
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        cotization: @cotization
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        cotization: @cotization.errors
      )
    end
  end

end
