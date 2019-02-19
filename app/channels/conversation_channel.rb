class ConversationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # comment
    stream_from "conversations-#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def create_message(request_data)
    @message = JSON.parse(request_data)
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

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      conversations: @conversations
    )
  end

  def own_profiles_conversations(request_data=nil)
    @user = current_user
    ids   = JSON.parse(request_data)
    ids   = ids['profile_ids'].try(:split, '-').try(:map, &:to_i)
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

  def update_cotization(request_data)
    cotization = JSON.parse(request_data)
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

  def destroy_cotization(request_data)
    cotization = JSON.parse(request_data)
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
