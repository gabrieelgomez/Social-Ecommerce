class ScheduleSerializer < ActiveModel::Serializer
  attributes *Tag.column_names
end
