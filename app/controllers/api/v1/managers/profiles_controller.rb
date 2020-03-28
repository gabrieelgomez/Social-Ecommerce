module Api::V1
  module Managers
    class ProfilesController < ManagersController
      before_action :set_profile, only: %i[censorship set_profile_validation]
      before_action :verify_validation_range, only: %i[set_profile_validation]
  
      def censorship
        if params[:censorship] == 'censor'
          @profile.update(censured: true)
        elsif params[:censorship] == 'uncensor'
          @profile.update(censured: false)
        end
        render json: @profile, status: 200
      end

      def get_profiles
        @profiles = Profile.all
        render json: @profiles, status: 200
      end

      def set_profile_validation
        if @profile.update(validation: params[:val_number])
          render json: @profile, status: 200
        else
          render json: @profile.errors, status: 422
        end
      end

      private

      def verify_validation_range
        unless (1..3).include?(params[:val_number].to_i)
          render json: {
            errors: [
              "Validation number not permitted"
            ]
          }, status: 422
        end
      end

      def set_profile
        @profile = custom_find {
          Profile.find params[:profile_id]
        }
      end
    end
  end
end
