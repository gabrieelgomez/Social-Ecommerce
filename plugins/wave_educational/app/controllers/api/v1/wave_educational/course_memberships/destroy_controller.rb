# module Api::V1::WaveEducational::CourseMemberships
#   class DestroyController < CourseMembershipsController
#     before_action :set_course_membership, only: %i[destroy]
#
#     def destroy
#       if @course_membership.destroy
#         render json: @course_membership, status: 200
#       else
#         render json: @course_membership.errors,
#                status: 422
#       end
#     end
#
#   end
# end
