module Api::V1::PolicyTerms
  class ShowController < PolicyTermsController
    before_action :set_policy_term, only: %i[show]

    def show
      render json: @policy_term, status: 200
    end
  end
end