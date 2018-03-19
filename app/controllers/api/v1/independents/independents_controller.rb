module Api::V1
  class Independents::IndependentsController < ApiController

    private

    def set_independent
      @independent = Independent.where(type_profile: 'independent').find(params[:id])
    end
  end
end
