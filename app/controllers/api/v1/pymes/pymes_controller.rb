module Api::V1
  class Pymes::PymesController < ApiController

    private

    def set_my_pyme
      @pyme = custom_find {
        current_v1_user.pymes.find(params[:id])
      }
    end

    def set_pyme
      # byebug
      @pyme = custom_find{ Pyme.find(params[:id]) }
    end
  end
end
