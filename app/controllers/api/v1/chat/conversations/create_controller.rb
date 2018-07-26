module Api::V1::Chat::Conversations
  class CreateController < ConversationsController
    before_action :set_recipientable
    before_action :set_senderable

    def create
      # byebug
      @conversation = Conversation.get(@senderable, @recipientable, params[:type_messages])
      # byebug
      if @conversation.valid?
        render json: @conversation, status: 200
      else
        render json: @conversation.errors, status: 500
      end
    end

    private

    def set_senderable
      conv = params[:conversation]
      return @senderable = current_v1_user if conv[:senderable_type].nil?
      model = conv[:senderable_type].downcase.pluralize.to_sym
      @senderable = custom_find {
        current_v1_user.try(model).find conv[:senderable_id]
      }
      # if conv[:senderable_type] == 'User'
        
      # else
      #   model = conv[:senderable_type].constantize
      #   @senderable = custom_find {
      #     model.find conv[:senderable_id]
      #   }
      # end
    end

    def set_recipientable
      conv = params[:conversation]
      # return @recipientable = current_v1_user if conv[:recipientable_type].nil?
      model = conv[:recipientable_type].constantize
      @recipientable = custom_find {
        model.find conv[:recipientable_id]
      }
      # if conv[:recipientable_type] == 'User'
      # elsif conv[:recipientable_type] == 'Profile'
      #   model = conv[:recipientable_type].downcase.pluralize.to_sym
      #   @recipientable = custom_find {
      #     current_v1_user.try(model).find conv[:recipientable_id]
      #   }
      # end
    end
  end
end
