module Api::V1
  class Pymes::PymesController < ApiController

    private

    def set_pyme
      @pyme = Pyme.where(type_profile: 'pyme').find(params[:id])
    end
  end
end
