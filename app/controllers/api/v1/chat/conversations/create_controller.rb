module Api::V1::Chat::Conversations
  class CreateController < ConversationsController
    before_action :set_recipientable
    before_action :set_senderable

    def create
      # byebug
      @conversation = Conversation.get(@senderable, @recipientable)
      render json: @conversation
    end

    private

    def set_senderable
      conv = params[:conversation]
      return @senderable = current_v1_user if conv[:senderable_type].nil?
      model = conv[:senderable_type].downcase.pluralize.to_sym
      # byebug
      @senderable = current_v1_user.try(model).try(:find, conv[:senderable_id])
      # byebug
    end

    def set_recipientable
      conv = params[:conversation]
      model = conv[:recipientable_type].constantize
      @recipientable = model.try(:find, conv[:recipientable_id])
      # byebug
    end
  end
end
