module Api::V1::Statistics
	class Profiles::ProfilesController < StatisticsController

		private
		
		def set_my_profile
			@profile = custom_find {
				current_v1_user.profiles.find(params[:profile_id])
			}
		end

		def model_name
			@profile.class.to_s
		end

  end
end
