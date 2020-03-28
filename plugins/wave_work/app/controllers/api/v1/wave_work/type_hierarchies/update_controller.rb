module Api::V1::WaveWork::TypeHierarchies
  class UpdateController < TypeHierarchiesController
    before_action :set_type_hierarchy, only: %i[update]

    def update
      if @type_hierarchy.update(type_hierarchy_params)
        render json: @type_hierarchy, status: 200
      else
        render json: @type_hierarchy.errors,
               status: 422
      end
    end

  end
end
