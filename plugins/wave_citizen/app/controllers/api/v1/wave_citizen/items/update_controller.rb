module Api::V1::WaveCitizen::Items
  class UpdateController < ItemsController
    before_action :set_item, only: %i[update]

    def update
      if @item.update(item_params)
        render json: @item, status: 200
      else
        render json: @item.errors,
               status: 422
      end
    end

  end
end
