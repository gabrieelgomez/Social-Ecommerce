# frozen_string_literal: true

module Api::V1::Likes
  # Likes CreateController
  class CreateController < LikesController
    def create
      likeable = likeable_type.modelarize.find(likeable_id)
      @like = likeable.liked_by current_v1_user
      if @like
        render json: {
          status: @like,
          type: 'liked',
          total_likes_by_likeable: likeable.get_likes.size,
          likes_by_likeable: likeable.get_likes.as_json(only: %i[votable_type
                                                                 votable_id
                                                                 voter_type
                                                                 voter_id],
                                                        include: {
                                                          voter: {
                                                            only: %i[id email
                                                                     name
                                                                     nickname
                                                                     avatar]
                                                          }
                                                        })
        }, status: 200
      else
        render json: @like,
               status: 422
      end
    end
  end
end
