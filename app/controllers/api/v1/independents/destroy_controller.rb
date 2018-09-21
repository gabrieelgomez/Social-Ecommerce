# Api Module
module Api::V1::Independents
  # Destroy Controller
  class DestroyController < IndependentsController
    before_action :authenticate_v1_user!, only: %i[destroy]
    before_action :validate_password, only: %i[destroy]
    before_action :set_my_independent, only: %i[destroy]

    def destroy
      return access_denied if current_v1_user.has_role? [:editor, :moderator], @independent
      if @independent.destroy
        render json: @independent, status: 200
      else
        render json: @independent.errors,
               status: 200
      end
    end

    def access_denied
      render json: {errors: 'Access Denied'}
    end

  end
end
