module Api::V1
  module Managers
    class ProfilesController < ManagersController
      before_action :set_profile, only: %i[censorship]
  
      def censorship
        if params[:censorship] == 'censor'
          @profile.update(censured: true)
        elsif params[:censorship] == 'uncensor'
          @profile.update(censured: false)
        end
        render json: @profile, status: 200
      end

      private

      def set_profile
        @profile = custom_find {
          Profile.find params[:profile_id]
        }
      end
    end
  end
end
