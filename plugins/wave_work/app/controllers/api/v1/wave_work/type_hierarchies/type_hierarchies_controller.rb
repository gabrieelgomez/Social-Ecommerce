module Api::V1::WaveWork
  class TypeHierarchies::TypeHierarchiesController < WaveWorkController
    before_action :verify_superadmin_rol, only: %i[create destroy update]

    private

    def set_type_hierarchy
      @type_hierarchy = WaveWork::TypeHierarchy.find(params[:type_hierarchy_id])
    end

    def type_hierarchy_params
      params.require(:type_hierarchy).permit(:title)
    end

  end
end
