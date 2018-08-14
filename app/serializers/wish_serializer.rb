class WishSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget, :description, :user,
             :wisheable, :priority, :created_time
  def created_time
    object.created_at.strftime("%F / %T")
  end
end
