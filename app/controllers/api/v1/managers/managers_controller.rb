module Api::V1
  class Managers::ManagersController < ApiController
    before_action :authenticate_v1_user!
    before_action :verify_superadmin_rol
  
    private
  
    def verify_superadmin_rol
      unless current_v1_user.has_role? :superadmin
        render json: {
          errors: [
            "You are not authorized to this action."
          ]
        }, status: 401
      end
    end
  end
end
