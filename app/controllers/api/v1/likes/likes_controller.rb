# frozen_string_literal: true

module Api::V1
  class Likes::LikesController < ApiController
    before_action :authenticate_v1_user!, except: %i[index show]

    private

    def like_params
      params
    end

    def likeable_type
      like_params[:likeable_type]
    end

    def likeable_id
      like_params[:likeable_id]
    end
  end
end
