module Api::V1
  class Pymes::PymesController < ApiController

    private

    def set_my_pyme
      @pyme = custom_find {
        current_v1_user.pymes.find(params[:id])
      }
      validate_roles if @pyme.include?('Record not found')
    end

    def validate_roles
      pyme = Pyme.find(params[:id]) rescue Profile
      permission = current_v1_user.has_role? [:admin, :editor], pyme
      @pyme = pyme if permission
    end

    def set_pyme
      @pyme = custom_find { Pyme.find(params[:id]) }
    end
  end
end
