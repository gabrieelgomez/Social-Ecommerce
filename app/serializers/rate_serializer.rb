class RateSerializer < ActiveModel::Serializer
  attributes *Rate.column_names
end
