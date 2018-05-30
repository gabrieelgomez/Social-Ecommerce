module Api::V1::Chat::Conversations
  class CreateController < ConversationsController
    before_action :set_recipient

    def create
      @conversation = Conversation.get(current_v1_user.id, @recipient.id)
      render json: @conversation
    end

    private

    def set_recipient
      @recipient = User.find_by(nickname: params[:nickname])
    end
  end
end
