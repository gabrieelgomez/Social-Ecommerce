module Api::V1::Followers::Profiles
	class ActionController < ProfilesController
		before_action :set_follower, only: [:create_follow, :followers, :unfollow]
		before_action :unfollow_params, only: [:unfollow]

		#Crear un seguidor
		def create_follow
		  @follow = current_v1_user.follow_profile(@follower, model_name.to_s)
		  render json: @follow
		end

		#Dejar de seguir
		def unfollow
		  @unfollow = current_v1_user.stop_following_by_profile(@follower, model_name.to_s)
		  render json: @unfollow
		end

		#Listar todos los seguidores de un Profile de un Usuario
		def followers
		  @followers = @follower.followers_by_type_profile('User', model_name.to_s)
		  render json: @followers
		end

		#Listar todos los perfiles que un Usuario sigue
		def following
		  @following = current_v1_user.follow_by_profile(model_name.to_s)
		  render json: @following
		end

	end
end
