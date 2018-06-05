module Api::V1::Followers::Users
  class ActionController < UsersController
    before_action :set_follower_user, only: %i[create_follow unfollow]
    before_action :unfollow_params_user, only: %i[unfollow]

    # Crear un seguidor
    def create_follow
      @follow = current_v1_user.follow(@follower)
      render json: @follow, status: 200
    end

    def unfollow
      @unfollow = current_v1_user.stop_following(@follower)
      render json: @unfollow, status: 200
    end

    # Listar todos los seguidores de un User
    def followers
      @followers = current_v1_user.user_followers
      render json: @followers, status: 200
    end

    # Listar los que sigue un Usuario
    def following
      @following = current_v1_user.following_users
      render json: @following, status: 200
    end
  end
end
