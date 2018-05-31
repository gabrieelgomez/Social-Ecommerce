module Api::V1
  class Independents::IndependentsController < ApiController

    private

    def set_my_independent
      @independent = custom_find { 
        current_v1_user.independents.find(params[:id])
      }
    end

    def set_independent
      @independent = custom_find{ Independent.find(params[:id]) }
    end
  end
end
