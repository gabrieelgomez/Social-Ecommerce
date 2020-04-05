module Api::V1::WaveCitizen::Items
  class CreateController < ItemsController

    def create
      @item = WaveCitizen::Item.new(item_params)

      if item_params[:poll_id].nil?
        render json: {errors: 'Poll id should exist'}, status: 200
      elsif @item.save
        render json: @item, status: 200
      else
        render json: @item.errors,
               status: 422
      end
    end

  end
end
