module Api::V1::Posts
  class ShowController < PostsController
    before_action :set_post, only: %i[show]
    before_action :set_postable, only: %i[history]

    def index
      @posts = Post.all
      render json: @posts, status: 200
    end

    def show
      render json: @post, status: 200
    end

    def history
      render json: @postable.posts, status: 200
    end

    private

    def set_postable
      pms = params
      return @postable = current_v1_user if pms[:postable_id].nil?

      if pms[:postable_type] == 'Intranet::Intranet'
        ids = current_v1_user.profiles.map(&:intranet).compact.map(&:id)
        @postable = custom_find do
          Intranet::Intranet.where(id: ids).find pms[:postable_id]
        end
      else
        @postable = custom_find do
          pms[:postable_type].singularize.camelize.constantize.find_by id: pms[:postable_id]
        end
      end

    end

  end
end
