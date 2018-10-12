module Api::V1::JobOffers::Questions::QOptions
  class ShowController < QOptionsController
    before_action :set_profile              , only: %i[index]
    before_action :set_job_offers_of_profile, only: %i[index]
    before_action :set_question             , only: %i[index]

    def index
      @options = @question.options
      render json: @options, status: 200
    end

    def show; end
  end
end
