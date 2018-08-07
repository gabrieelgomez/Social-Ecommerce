module Api::V1
  class Managers::ManagersController < ApiController
    before_action :authenticate_v1_user!
    before_action :verify_superadmin_rol
  end
end
