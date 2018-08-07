module Api::V1
  class Independents::IndependentsController < ApiController

    private

    def set_my_independent
      @independent = custom_find {
        current_v1_user.independents.find(params[:id])
      }
      validate_roles if @independent.include?('Record not found')
    end

    def validate_roles
      independent = Independent.find(params[:id]) rescue Profile
      permission = current_v1_user.has_role? [:admin, :editor], independent
      @independent = independent if permission
    end

    def set_independent
      @independent = custom_find { Independent.find(params[:id]) }
    end
  end
end
