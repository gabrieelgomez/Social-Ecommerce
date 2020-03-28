# Api Module
module Api::V1::Pymes
  # Destroy Controller
  class DestroyController < PymesController
    before_action :authenticate_v1_user!
    before_action :validate_password, only: %i[destroy]
    before_action :set_my_pyme, only: %i[destroy]

    def destroy
      return access_denied if current_v1_user.has_role? [:editor, :moderator], @pyme
      if @pyme.destroy
        render json: @pyme, status: 200
      else
        render json: @pyme.errors, status: 422
      end
    end

    def access_denied
      render json: {errors: 'Access Denied'}
    end

  end
end
