module Api::V1
  class ManagersProfiles::ManagersProfilesController < ApiController
    before_action :authenticate_v1_user!
  end
end
