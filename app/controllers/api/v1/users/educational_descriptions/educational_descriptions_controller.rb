module Api::V1::Users
  class EducationalDescriptions::EducationalDescriptionsController < UsersController
    before_action :authenticate_v1_user!#, except: [:show]
    before_action :set_user, only: %i[index create show update destroy]
    before_action :set_educational, only: %i[show update destroy]

    def index
      render json: @user.educational_descriptions
    end

    def create
      @educational = @user.educational_descriptions.new(educational_description_params)
      if @educational.save!
        render json: @educational, status: 201
      else
        render json: @educational.errors, status: 500
      end
    end

    def index
      render json: @user.educational_descriptions
    end

    def show
      render json: @educational
    end

    def update
      if @educational.update(educational_description_params)
        render json: @educational, status: 200
      else
        render json: @educational.errors, status: 500
      end
    end

    def destroy
      if @educational.destroy
        render json: @educational, status: 200
      else
        render json: @educational.errors, status: 500
      end
    end

    private

    def set_user
      @user = current_v1_user
    end

    def set_educational
      @educational = @user.educational_descriptions.find(params[:educational_id])
    end

    def educational_description_params
      params.require(:educational_description).permit(:institution, :degree, :academic_discipline, :note, :activities_groups, :start_date, :end_date, :current, :description, files: [])
    end

  end
end
