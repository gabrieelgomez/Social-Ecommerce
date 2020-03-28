module Api::V1::WaveWork::TypeHierarchies
  class CreateController < TypeHierarchiesController

    def create
      @type_hierarchy = WaveWork::TypeHierarchy.new(type_hierarchy_params)
      if @type_hierarchy.save
        render json: @type_hierarchy, status: 200
      else
        render json: @type_hierarchy.errors,
               status: 422
      end
    end

  end
end
