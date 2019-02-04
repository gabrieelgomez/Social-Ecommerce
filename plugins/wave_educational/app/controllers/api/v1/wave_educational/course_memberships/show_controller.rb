module Api::V1::WaveEducational::CourseMemberships
  class ShowController < CourseMembershipsController
    before_action :set_course, only: %i[students show]


    def my_subscriptions
      render json: current_v1_user.course_memberships.order(id: :asc), status: 200
    end

    def show
      @course_membership = @course.course_memberships.find_by(user_id: current_v1_user.id)
      render json: @course_membership, status: 200
    end

    def students
      @students = @course.course_memberships.collect{|cm| cm.student}
      @students.push(total_students: @students.count)
      render json: @students, status: 200
    end

  end
end
