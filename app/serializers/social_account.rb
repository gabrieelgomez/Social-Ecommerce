class SocialAccountSerializer < ActiveModel::Serializer
  attributes *Tag.column_names
end
