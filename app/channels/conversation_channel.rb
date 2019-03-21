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
    Conversation.current_user = current_user
    @user = current_user
    @cotizations = Conversation.user_conversations(@user).where(type_messages: 'cotization').select{|conv| conv.membership?(@user)}.as_json(
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
      cotizations_conversations: @cotizations
    }

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      conversations: @conversations
    )
  end

  def own_profiles_conversations(data=nil)
    @user = current_user
    ids   = data['profile_ids'].try(:split, '-').try(:map, &:to_i)
    @profiles = @user.profiles.where(id: ids)
    @profiles = @user.profiles if @profiles.empty?
    @conversations = @profiles.map do |prof|
      Conversation.current_user = prof
      prof.as_json(only: [:id], methods: [:type, :name]).merge(
        conversations: prof.conversations.as_json(
          only: [
            :id
          ], methods: [
            :type_conversation, :sender_messageable, :receptor_messageable
          ], include: [
            :messages
          ]
        )
      )
    end

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      conversations: @conversations
    )
  end

  def update_cotization(data)
    cotization = data['cotization']
    @cotization = Cotization.find cotization['cotization_id'].to_i

    if @cotization.update(cotization['stage'])
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        status_transaction: 'success',
        status_cotization: @cotization.stage,
        cotization: @cotization
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        status_transaction: 'failed',
        cotization: @cotization.errors
      )
    end
  end

  def destroy_cotization(data)
    cotization  = data['cotization']
    @cotization = Cotization.find cotization['cotization_id'].to_id

    if @cotization.destroy
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        status_transaction: 'success',
        status_cotization: @cotization.stage,
        cotization: @cotization
      )
    else
      ActionCable.server.broadcast(
        "conversations-#{current_user.id}",
        status_transaction: 'failed',
        cotization: @cotization.errors
      )
    end
  end

end
