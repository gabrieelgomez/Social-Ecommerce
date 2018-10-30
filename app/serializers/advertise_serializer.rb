class AdvertiseSerializer < ActiveModel::Serializer
  attributes :id, :budget, :creator, :clicked_count, :seen_count, :created_at
end
