module Api::V1::Chat::Conversations
  class CreateController < ConversationsController
    before_action :set_recipientable
    before_action :set_senderable

    def create
      @conversation = Conversation.get(@senderable, @recipientable)
      render json: @conversation, status: 200
    end

    private

    def set_senderable
      conv = params[:conversation]
      return @senderable = current_v1_user if conv[:senderable_type].nil?
      model = conv[:senderable_type].downcase.pluralize.to_sym
      @senderable = custom_find {
        current_v1_user.try(model).find conv[:senderable_id]
      }
    end

    def set_recipientable
      conv = params[:conversation]
      model = conv[:recipientable_type].constantize
      @recipientable = custom_find {
        model.find conv[:recipientable_id]
      }
    end
  end
end
