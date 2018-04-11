module Api::V1::Followers::Users
	class ActionController < UsersController
		before_action :set_follower_user, only: [:create_follow, :unfollow]
		before_action :unfollow_params_user, only: [:unfollow]

		#Crear un seguidor
		def create_follow
		  @follow = current_v1_user.follow(@follower)
		  render json: @follow
		end

		def unfollow
		  @unfollow = current_v1_user.stop_following(@follower)
		  render json: @unfollow
		end

		#Listar todos los seguidores de un User
		def followers
		  @followers = current_v1_user.user_followers
		  render json: @followers
		end

		#Listar los que sigue un Usuario
		def following
		  @following = current_v1_user.following_users
		  render json: @following
		end

	end
end
