module Api::V1::WaveCitizen
  class Items::ItemsController < WaveCitizenController
    before_action :set_current_user_support

    private

    def set_item
      @item = WaveCitizen::Item.find_by(id: params[:item_id])
    end

    def item_params
      params.require(:item).permit(:title, :description, :poll_id)
    end

  end
end
