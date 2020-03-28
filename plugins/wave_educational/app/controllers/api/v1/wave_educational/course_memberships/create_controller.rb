module Api::V1::WaveEducational::CourseMemberships
  class CreateController < CourseMembershipsController
    before_action :set_course, only: [:create]

    def create
      @course_membership = WaveEducational::CourseMembership.new(course_membership_params)
      @course_membership.user   = current_v1_user
      @course_membership.course = @course

      if @course_membership.save
        render json: @course_membership, status: 200
      else
        render json: @course_membership.errors,
               status: 422
      end
    end

  end
end
