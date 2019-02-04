module Api::V1::WaveEducational
  class CourseMemberships::CourseMembershipsController < WaveEducationalController

    private

    def set_course
      @course = WaveEducational::Course.find(params[:course_id])
    end

    def set_course_membership
      @course_membership = WaveEducational::CourseMembership.find(params[:course_membership_id])
    end

    def course_membership_params
      params.require(:course_membership).permit(:status, :subscribed, :course_id)
    end

  end
end
