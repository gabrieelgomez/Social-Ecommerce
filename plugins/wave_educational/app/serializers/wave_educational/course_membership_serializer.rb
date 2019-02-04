class WaveEducational::CourseMembershipSerializer < ActiveModel::Serializer
  attributes :id, :locked_by_teacher, :annulled_by_user, :status, :subscribed,
             :user, :course

  def user
    object.user
  end

  def course
    object.course
  end

end
