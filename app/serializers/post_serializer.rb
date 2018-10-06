class PostSerializer < ActiveModel::Serializer
  attributes *Post.column_names
end
