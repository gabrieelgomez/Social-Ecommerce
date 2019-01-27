module Api::V1::WaveWork::TypeHierarchies
  class DestroyController < TypeHierarchiesController
    before_action :set_type_hierarchy, only: %i[destroy]

    def destroy
      if @type_hierarchy.destroy
        render json: @type_hierarchy, status: 200
      else
        render json: @type_hierarchy.errors,
               status: 500
      end
    end

  end
end
