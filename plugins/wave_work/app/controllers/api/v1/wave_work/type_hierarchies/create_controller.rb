module Api::V1::WaveWork::TypeHierarchies
  class CreateController < TypeHierarchiesController

    def create
      @type_hierarchy = WaveWork::TypeHierarchy.new(type_hierarchy_params)
      if @type_hierarchy.save
        render json: @type_hierarchy, status: 201
      else
        render json: @type_hierarchy.errors,
               status: 500
      end
    end

  end
end
