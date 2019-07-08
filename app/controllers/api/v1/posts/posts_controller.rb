module Api::V1
  class Posts::PostsController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show history]

    private

    def set_own_post
      @post = custom_find { Post.find params[:post_id] }
      @user = current_v1_user
      post_in_profiles = @user.profiles.collect{|prof| prof.posts.exists? @post.id}
      if @user.posts.exists?(@post.id) || post_in_profiles.include?(true)
        return @post
      end
    end

    def set_post
      @post = Post.find params[:post_id]
    end

    def post_params
      params.require(:post).permit(:content, :title, :banner, :postable_type, :postable_id)
    end

    def set_postable
      pms = params[:post]
      return @postable = current_v1_user if pms[:postable_id].nil?

      if pms[:postable_type] == 'Intranet::Intranet'
        ids = current_v1_user.profiles.map(&:intranet).compact.map(&:id)
        @postable = custom_find do
          Intranet::Intranet.where(id: ids).find pms[:postable_id]
        end
      else
        @postable = custom_find do
          current_v1_user.profiles.find pms[:postable_id]
        end
      end

    end
  end
end
