module Api::V1
  class ApiController < ApplicationController
    include ErrorSerializer
    include Concerns::PasswordValidation
    respond_to :json

    private

    def general_params(object)
      params.require(object).permit(:user_id, :title, :name, :type_profile,
                                    :email, :banner, :photo, :launched,
                                    :phone,:url, :address, :vision, :mission,
                                    :description,:web, :profile, :experience,
                                    :country)
    end

    def rescue_not_found
      render json: {
        error: [
          "#{I18n.t :not_found.to_s}"
          # 'Not found'
          # t('not_found')
        ]
      }, status: 404
    end

    def custom_find
      yield
    rescue ActiveRecord::RecordNotFound
      rescue_not_found
    end
  end
end
