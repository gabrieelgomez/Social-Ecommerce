module Api::V1::WaveCitizen::Items
  class DestroyController < ItemsController
    before_action :set_item, only: %i[destroy]

    def destroy
      if @item.destroy
        render json: @item, status: 200
      else
        render json: @item.errors,
               status: 422
      end
    end

  end
end
