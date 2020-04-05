module Api::V1::WaveCitizen
  class Items::ItemsController < WaveCitizenController

    private

    def set_item
      @item = WaveCitizen::Item.find_by(id: params[:item_id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :poll_id)
    end

  end
end
