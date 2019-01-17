module Api::V1::WaveEducational
  class Teachers::TeachersController < WaveEducationalController
    # include ::Api::V1::WaveEducational::Concerns::ModelModulationEducational
    before_action :set_teacher, only: [:products_prominent]

    def all_teachers
      @result = Teacher.all.uniq.as_json(only: [:id, :title, :slug, :photo, :created_at, :updated_at, :type_teacher], methods: :category_ids)
      render json: @result, status: 200
    end

    def products_prominent
      @result = Teacher.find(params[:teacher_id]).products.select{|product| product.prominent == true }
      render json: @result, status: 200
    end

    private

    def set_teacher
      @teacher = custom_find {
        Teacher.find(params[:teacher_id])
      }
    end

    def validate_roles
      teacher = Teacher.find(params[:id]) rescue Teacher
      permission = current_v1_user.has_role? [:admin, :editor], teacher
      @teacher = teacher if permission
    end

  end
end
