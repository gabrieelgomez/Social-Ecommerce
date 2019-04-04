module Api::V1::Followers::Profiles
  class ActionController < ProfilesController
    before_action :set_follower, only: %i[create_follow followers unfollow]
    before_action :unfollow_params, only: %i[unfollow]

    # Crear un seguidor
    def create_follow
      @follow = current_v1_user.follow_profile(@follower, model_name.to_s)
      render json: @follow, status: 200
    end

    # Dejar de seguir
    def unfollow
      @unfollow = current_v1_user.stop_following_by_profile(@follower, model_name.to_s)
      render json: @unfollow, status: 200
    end

    # Listar todos los seguidores de un Profile de un Usuario
    def followers
      @followers = @follower.followers_by_type_profile('User', model_name.to_s)
      render json: @followers, status: 200
    end

    # Listar todos los perfiles que un Usuario sigue
    def following
      categories  = params[:categories].try(:split, '-').try(:map, &:to_i)
      ids = current_v1_user.follow_by_profile(model_name.to_s).pluck(:id)
      @following = model_name.where(id: ids)
      @following = @following.ransack(categories_id_in: categories).result
      render json: @following, status: 200
    end
  end
end
