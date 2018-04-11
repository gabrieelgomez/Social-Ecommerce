module Api::V1::Followers::Concerns::Following
	extend ActiveSupport::Concern

	private

  def model_name
    params[:type_profile].singularize.camelize.constantize
  end

	def set_follower
		@follower = model_name.find(params[:profile_id])
	end

	def unfollow_params
		params.require(:unfollow).permit(:profile_id)
	end

	def set_follower_user
		@follower = params[:user_id].nil? ? User.find(unfollow_params_user[:user_id]) : User.find(params[:user_id])
	end

	def unfollow_params_user
		params.require(:unfollow).permit(:user_id)
	end

end
