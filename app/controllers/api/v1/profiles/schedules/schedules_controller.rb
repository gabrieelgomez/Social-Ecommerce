module Api::V1::Profiles
  class Schedules::SchedulesController < ProfilesController
    before_action :authenticate_v1_user!
    before_action :set_profile, only: [:show, :update]


    def show
			render json: @profile.schedule
		end

		def update
      @new = JSON.parse(params[:schedule].to_json)
      @profile.schedule.update(@new)
      if @profile.schedule.save
        render json: @profile.schedule,
               status: 200
      else
        render json: @profile.schedule.errors, status: 500
      end
    end

		private
		def set_profile
			@profile = custom_find {
        Profile.find(params[:profile_id])
      }
		end

		def schedule_params
      params.require(:schedule).permit(:monday, :tuesday, :wednesday, :thursday,
                                       :friday, :saturday, :sunday)
    end

  end
end
