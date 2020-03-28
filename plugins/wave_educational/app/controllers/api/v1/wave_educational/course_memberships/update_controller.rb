module Api::V1::WaveEducational::CourseMemberships
  class UpdateController < CourseMembershipsController
    before_action :set_course_membership, only: %i[annulled locked]

    def annulled
      @course_membership = current_v1_user.course_memberships.find_by(course_id: params[:course_id])
      @course_membership.toggle :annulled_by_user
      if @course_membership.save
        render json: @course_membership, status: 200
      else
        render json: @course_membership.errors,
               status: 422
      end
    end

    def locked
      @course_membership.toggle :locked_by_teacher
      if @course_membership.course.teacher.user == current_v1_user
        @course_membership.save
        render json: @course_membership, status: 200
      else
        render json: {erros: "You aren't teacher's course"},
               status: 200
      end
    end

  end
end
