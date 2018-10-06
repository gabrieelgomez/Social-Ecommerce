class ScheduleSerializer < ActiveModel::Serializer
  attributes *Schedule.column_names
end
